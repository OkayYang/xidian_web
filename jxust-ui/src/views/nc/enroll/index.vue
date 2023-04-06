<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="比赛标题" prop="contestName">
        <el-input
          v-model="queryParams.contestName"
          placeholder="请输入比赛标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户网名" prop="uNick">
        <el-input
          v-model="queryParams.uNick"
          placeholder="请输入用户网名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户姓名" prop="uName">
        <el-input
          v-model="queryParams.uName"
          placeholder="请输入用户姓名"
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
      <el-form-item label="专业" prop="uMajor">
        <el-input
          v-model="queryParams.uMajor"
          placeholder="请输入专业"
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
      <el-form-item label="申请状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择申请状态" clearable>
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
          v-hasPermi="['nc:enroll:add']"
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
          v-hasPermi="['nc:enroll:edit']"
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
          v-hasPermi="['nc:enroll:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['nc:enroll:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="enrollList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="申请表ID" align="center" prop="enrollId" />
      <el-table-column label="比赛标题" align="center" prop="contestName" />
      <el-table-column label="用户网名" align="center" prop="uNick" />
      <el-table-column label="用户姓名" align="center" prop="uName" />
      <el-table-column label="用户性别" align="center" prop="uSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.uSex"/>
        </template>
      </el-table-column>
      <el-table-column label="学号" align="center" prop="uXh" />
      <el-table-column label="学院" align="center" prop="uDepartment" />
      <el-table-column label="专业" align="center" prop="uMajor" />
      <el-table-column label="班级" align="center" prop="uClassname" />
      <el-table-column label="头像" align="center" prop="uImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.uImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="用户类别" align="center" prop="uType" />
      <el-table-column label="申请时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请状态" align="center" prop="status">
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
            v-hasPermi="['nc:enroll:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['nc:enroll:remove']"
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

    <!-- 添加或修改VIEW对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="editForm" :rules="rules" label-width="80px">
<!--        <el-form-item label="申请表ID" prop="enrollId">-->
<!--          <el-input v-model="form.enrollId" placeholder="请输入申请表ID" />-->
<!--        </el-form-item>-->
        <el-form-item label="比赛ID" prop="enrollCid">
          <el-input v-model="editForm.enrollCid" placeholder="请输入比赛ID" />
        </el-form-item>
        <el-form-item label="用户UID" prop="enrollUid">
          <el-input v-model="editForm.enrollUid" placeholder="请输入用户UID" />
        </el-form-item>
        <el-form-item label="申请状态" prop="status">
          <el-radio-group v-model="editForm.status">
            <el-radio
              v-for="dict in dict.type.sys_common_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
<!--        <el-form-item label="审核员" prop="Auditor">-->
<!--          <el-input v-model="form.Auditor" placeholder="请输入审核员" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listEnroll, getEnroll, delEnroll, addEnroll, updateEnroll } from "@/api/nc/enroll";

export default {
  name: "Enroll",
  dicts: ['sys_common_status', 'sys_user_sex'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedNcUser: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 报名记录表格数据
      enrollList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        contestName: null,
        uNick: null,
        uName: null,
        uXh: null,
        uDepartment: null,
        uMajor: null,
        uClassname: null,
        status: null,
      },
      // 表单参数
      form: {},

      editForm:{},
      // 表单校验
      // 表单校验
      rules: {
        enrollUid:[
          { required: true, message: "申请人UID不能为空", trigger: "blur" }
        ],
        enrollCid:[
          { required: true, message: "申请赛事ID不能为空", trigger: "blur" }

        ],
        enrollId: [
          { required: true, message: "申请表ID不能为空", trigger: "blur" }
        ],
        contestId: [
          { required: true, message: "比赛ID不能为空", trigger: "blur" }
        ],
        uid: [
          { required: true, message: "用户UID不能为空", trigger: "blur" }
        ],

      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询报名记录列表 */
    getList() {
      this.loading = true;
      listEnroll(this.queryParams).then(response => {
        this.enrollList = response.rows;
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
      this.editForm={
        enrollId:null,
        enrollUid:null,
        enrollCid:null,
        status: null,
      },
      this.form = {
        enrollId: null,
        contestId: null,
        contestName: null,
        uid: null,
        uNick: null,
        uName: null,
        uSex: null,
        uXh: null,
        uDepartment: null,
        uMajor: null,
        uClassname: null,
        uImage: null,
        uType: null,
        createTime: null,
        status: null,
        Auditor: null
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
      this.ids = selection.map(item => item.enrollId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加报名记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const enrollId = row.enrollId || this.ids
      getEnroll(enrollId).then(response => {
        console.log(response.data)

        this.editForm.enrollId = response.data.enrollId;
        this.editForm.enrollCid = response.data.contestId;
        this.editForm.enrollUid = response.data.uid;
        this.editForm.status = response.data.status;
        this.open = true;
        this.title = "修改报名记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.editForm.enrollId != null) {
            updateEnroll(this.editForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEnroll(this.editForm).then(response => {
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
      const enrollIds = row.enrollId || this.ids;
      this.$modal.confirm('是否确认删除报名记录编号为"' + enrollIds + '"的数据项？').then(function() {
        return delEnroll(enrollIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 用户管理序号 */
    rowNcUserIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 用户管理添加按钮操作 */
    handleAddNcUser() {
      let obj = {};
      obj.uNick = "";
      obj.uName = "";
      obj.uSex = "";
      obj.uXh = "";
      obj.uDepartment = "";
      obj.uMajor = "";
      obj.uClassname = "";
      obj.uQq = "";
      obj.uEmail = "";
      obj.uImage = "";
      obj.uType = "";
      obj.createTime = "";
      obj.status = "";
    },


    /** 导出按钮操作 */
    handleExport() {
      this.download('nc/enroll/export', {
        ...this.queryParams
      }, `enroll_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
