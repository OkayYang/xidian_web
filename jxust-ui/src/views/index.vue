<template>
  <div class="app-container home">

    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2 style="font-weight: bold">江西理工大学软工双创后台管理系统</h2>
        <p>
          软工双创后台管理系统是一款专门为江西理工大学软件工程学院打造的管理平台。该系统集成了多种功能，包括文章发布、文章管理、用户管理、话题管理、发布比赛，到处参赛人员，旨在帮助用户更有效地管理和协作团队，提高项目的完成质量和效率。同时，该系统还支持多种权限设置，可以根据不同角色的需求，灵活地控制用户的访问权限和操作权限。此外，该系统还具备良好的用户体验，易于操作和上手，能够快速提升工作效率。        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>

        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://github.com/PGone-AKA')"
            >访问作者Github</el-button
          >
          <el-button
            size="mini"
            icon="el-icon-s-home"
            plain
            @click="goTarget('https://jxust.ywenrou.cn')"
            >访问主页</el-button
          >
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>腾讯云api</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>微信小程序</h4>
            <ul>
              <li>Wxml</li>
              <li>Wxss</li>
              <li>Vant</li>
              <li>iView</li>
              <li>ColorUi</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>联系信息</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-promotion"></i> 官网：<el-link
                href="https://jxust.ywenrou.cn"
                target="_blank"
                >https://jxust.ywenrou.cn</el-link
              >
            </p>
            <p>
              <i class="el-icon-user-solid"></i> QQ：1347456958
            </p>


          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v1.0.0- 2023-04-05">
              <ol>
                <li>添加违规字符检测</li>
                <li>添加报名比赛模块</li>
                <li>上线讨论区</li>
                <li>理工双创小程序上线</li>

              </ol>
            </el-collapse-item>


          </el-collapse>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>技术支持</span>
          </div>
          <div class="body">
            <img
              src="http://jxust.ywenrou.cn/prod-api/profile/upload/2023/04/05/contract_20230405101704A008.jpg"
              alt="contract"
              width="100%"
            />
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >如在使用过程中遇到问题请联系作者微信</span
            >
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "1.0.0"
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

