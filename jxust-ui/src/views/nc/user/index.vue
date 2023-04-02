<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="网名" prop="uNick">
        <el-input
          v-model="queryParams.uNick"
          placeholder="请输入网名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="uName">
        <el-input
          v-model="queryParams.uName"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学号" prop="uXh">
        <el-input
          v-model="queryParams.uXh"
          placeholder="请输入学号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学院" prop="uDepartment">
        <el-input
          v-model="queryParams.uDepartment"
          placeholder="请输入学院"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级" prop="uClassname">
        <el-input
          v-model="queryParams.uClassname"
          placeholder="请输入班级"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身份" prop="uType">
        <el-input
          v-model="queryParams.uType"
          placeholder="请输入身份"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_common_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['nc:user:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['nc:user:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['nc:user:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['nc:user:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户UID" align="center" prop="uid" />
      <el-table-column label="网名" align="center" prop="uNick" />
      <el-table-column label="姓名" align="center" prop="uName" />
      <el-table-column label="性别" align="center" prop="uSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.uSex"/>
        </template>
      </el-table-column>
      <el-table-column label="学号" align="center" prop="uXh" />
      <el-table-column label="学院" align="center" prop="uDepartment" />
      <el-table-column label="专业" align="center" prop="uMajor" />
      <el-table-column label="班级" align="center" prop="uClassname" />
      <el-table-column label="QQ" align="center" prop="uQq" />
      <el-table-column label="邮箱" align="center" prop="uEmail" />
      <el-table-column label="头像" align="center" prop="uImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.uImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="身份" align="center" prop="uType" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_common_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['nc:user:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['nc:user:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="网名" prop="uNick">
          <el-input v-model="form.uNick" placeholder="请输入网名" />
        </el-form-item>
        <el-form-item label="姓名" prop="uName">
          <el-input v-model="form.uName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="uSex">
          <el-select v-model="form.uSex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="学号" prop="uXh">
          <el-input v-model="form.uXh" placeholder="请输入学号" />
        </el-form-item>
        <el-form-item label="介绍" prop="uDesc">
          <el-input v-model="form.uDesc" placeholder="请输入介绍" />
        </el-form-item>
        <el-form-item label="密码" prop="uPassword">
          <el-input v-model="form.uPassword" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="学院" prop="uDepartment">
          <el-input v-model="form.uDepartment" placeholder="请输入学院" />
        </el-form-item>
        <el-form-item label="专业" prop="uMajor">
          <el-input v-model="form.uMajor" placeholder="请输入专业" />
        </el-form-item>
        <el-form-item label="班级" prop="uClassname">
          <el-input v-model="form.uClassname" placeholder="请输入班级" />
        </el-form-item>
        <el-form-item label="QQ" prop="uQq">
          <el-input v-model="form.uQq" placeholder="请输入QQ" />
        </el-form-item>
        <el-form-item label="身份证" prop="uIdcard">
          <el-input v-model="form.uIdcard" placeholder="请输入身份证" />
        </el-form-item>
        <el-form-item label="邮箱" prop="uEmail">
          <el-input v-model="form.uEmail" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="头像" prop="uImage">
          <image-upload v-model="form.uImage"/>
        </el-form-item>
        <el-form-item label="身份" prop="uType">
          <el-input v-model="form.uType" placeholder="请输入身份" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_common_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="wx小程序标识用户id" prop="openid">
          <el-input v-model="form.openid" placeholder="请输入wx小程序标识用户id" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listUser, getUser, delUser, addUser, updateUser } from "@/api/nc/user";

export default {
  name: "User",
  dicts: ['sys_common_status', 'sys_user_sex'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户管理表格数据
      userList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        uNick: null,
        uName: null,
        uXh: null,
        uDepartment: null,
        uClassname: null,
        uType: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户管理列表 */
    getList() {
      this.loading = true;
      listUser(this.queryParams).then(response => {
        this.userList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        uid: null,
        uNick: null,
        uName: null,
        uSex: null,
        uXh: null,
        uDesc: null,
        uPassword: null,
        uDepartment: null,
        uMajor: null,
        uClassname: null,
        uQq: null,
        uIdcard: null,
        uEmail: null,
        uImage: null,
        uType: null,
        createTime: null,
        status: null,
        openid: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.uid)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const uid = row.uid || this.ids
      getUser(uid).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.uid != null) {
            updateUser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addUser(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const uids = row.uid || this.ids;
      this.$modal.confirm('是否确认删除用户管理编号为"' + uids + '"的数据项？').then(function() {
        return delUser(uids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('nc/user/export', {
        ...this.queryParams
      }, `user_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
