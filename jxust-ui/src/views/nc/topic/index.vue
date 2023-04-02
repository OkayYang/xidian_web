<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属类别" prop="topicTypeId">
        <el-input
          v-model="queryParams.topicTypeId"
          placeholder="请输入所属类别"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建者" prop="createUid">
        <el-input
          v-model="queryParams.createUid"
          placeholder="请输入创建者"
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
          v-hasPermi="['nc:topic:add']"
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
          v-hasPermi="['nc:topic:edit']"
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
          v-hasPermi="['nc:topic:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['nc:topic:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="topicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="话题id" align="center" prop="topicId" />
      <el-table-column label="内容" align="center" prop="topicContent" />
      <el-table-column label="图片" align="center" prop="topicImages" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.topicImages" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="收藏量" align="center" prop="topicStars" />
      <el-table-column label="点赞量" align="center" prop="topicLikes" />
      <el-table-column label="浏览量" align="center" prop="topicFlows" />
      <el-table-column label="所属类别" align="center" prop="topicTypeId" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createUid" />
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
            v-hasPermi="['nc:topic:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['nc:topic:remove']"
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

    <!-- 添加或修改讨论话题对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="内容" prop="topicContent">
          <el-input v-model="form.topicContent" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="图片" prop="topicImages">
          <image-upload v-model="form.topicImages"/>
        </el-form-item>
        <el-form-item label="收藏量" prop="topicStars">
          <el-input v-model="form.topicStars" placeholder="请输入收藏量" />
        </el-form-item>
        <el-form-item label="点赞量" prop="topicLikes">
          <el-input v-model="form.topicLikes" placeholder="请输入点赞量" />
        </el-form-item>
        <el-form-item label="浏览量" prop="topicFlows">
          <el-input v-model="form.topicFlows" placeholder="请输入浏览量" />
        </el-form-item>
        <el-form-item label="所属类别" prop="topicTypeId">
          <el-input v-model="form.topicTypeId" placeholder="请输入所属类别" />
        </el-form-item>
        <el-form-item label="创建者" prop="createUid">
          <el-input v-model="form.createUid" placeholder="请输入创建者" />
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
import { listTopic, getTopic, delTopic, addTopic, updateTopic } from "@/api/nc/topic";

export default {
  name: "Topic",
  dicts: ['sys_common_status'],
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
      // 讨论话题表格数据
      topicList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        topicContent: null,
        topicTypeId: null,
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
    /** 查询讨论话题列表 */
    getList() {
      this.loading = true;
      listTopic(this.queryParams).then(response => {
        this.topicList = response.rows;
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
        topicId: null,
        topicTitle: null,
        topicContent: null,
        topicImages: null,
        topicVideos: null,
        topicStars: null,
        topicLikes: null,
        topicFlows: null,
        topicTypeId: null,
        createTime: null,
        createUid: null,
        status: null
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
      this.ids = selection.map(item => item.topicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加讨论话题";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const topicId = row.topicId || this.ids
      getTopic(topicId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改讨论话题";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.topicId != null) {
            updateTopic(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTopic(this.form).then(response => {
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
      const topicIds = row.topicId || this.ids;
      this.$modal.confirm('是否确认删除讨论话题编号为"' + topicIds + '"的数据项？').then(function() {
        return delTopic(topicIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('nc/topic/export', {
        ...this.queryParams
      }, `topic_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
