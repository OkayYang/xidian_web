<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关联文章id" prop="relateId">
        <el-input
          v-model="queryParams.relateId"
          placeholder="请输入关联文章id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论者id" prop="createUid">
        <el-input
          v-model="queryParams.createUid"
          placeholder="请输入评论者id"
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
          v-hasPermi="['nc:discuss:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="discussList"
      row-key="discussId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="父id" prop="parentId" />
      <el-table-column label="内容" align="center" prop="discussContent" />
      <el-table-column label="图片" align="center" prop="discussImages" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.discussImages" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="关联文章id" align="center" prop="relateId" />
      <el-table-column label="评论者id" align="center" prop="createUid" />
      <el-table-column label="评论时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="评论赞" align="center" prop="discussLikes" />
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
            v-hasPermi="['nc:discuss:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['nc:discuss:add']"
          >新增</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['nc:discuss:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改评论专区对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="父id" prop="parentId">
          <treeselect v-model="form.parentId" :options="discussOptions" :normalizer="normalizer" placeholder="请选择父id" />
        </el-form-item>
        <el-form-item label="内容" prop="discussContent">
          <el-input v-model="form.discussContent" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="图片" prop="discussImages">
          <image-upload v-model="form.discussImages"/>
        </el-form-item>
        <el-form-item label="关联文章id" prop="relateId">
          <el-input v-model="form.relateId" placeholder="请输入关联文章id" />
        </el-form-item>
        <el-form-item label="评论者id" prop="createUid">
          <el-input v-model="form.createUid" placeholder="请输入评论者id" />
        </el-form-item>
        <el-form-item label="评论赞" prop="discussLikes">
          <el-input v-model="form.discussLikes" placeholder="请输入评论赞" />
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
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDiscuss, getDiscuss, delDiscuss, addDiscuss, updateDiscuss } from "@/api/nc/discuss";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Discuss",
  dicts: ['sys_common_status'],
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 评论专区表格数据
      discussList: [],
      // 评论专区树选项
      discussOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        relateId: null,
        createUid: null,
        status: null
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
    /** 查询评论专区列表 */
    getList() {
      this.loading = true;
      listDiscuss(this.queryParams).then(response => {
        this.discussList = this.handleTree(response.data, "discussId", "parentId");
        this.loading = false;
      });
    },
    /** 转换评论专区数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.discussId,
        label: node.discussContent,
        children: node.children
      };
    },
    /** 查询评论专区下拉树结构 */
    getTreeselect() {
      listDiscuss().then(response => {
        this.discussOptions = [];
        const data = { discussId: 0, discussContent: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "discussId", "parentId");
        this.discussOptions.push(data);
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
        discussId: null,
        parentId: null,
        ancestors: null,
        discussContent: null,
        discussImages: null,
        createTime: null,
        relateId: null,
        createUid: null,
        discussLikes: null,
        status: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.discussId) {
        this.form.parentId = row.discussId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加评论专区";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.discussId;
      }
      getDiscuss(row.discussId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改评论专区";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.discussId != null) {
            updateDiscuss(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDiscuss(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除评论专区编号为"' + row.discussId + '"的数据项？').then(function() {
        return delDiscuss(row.discussId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
