import request from '@/utils/request'

// 查询文章管理列表
export function listArticle(query) {
  return request({
    url: '/nc/article/list',
    method: 'get',
    params: query
  })
}

// 查询文章管理详细
export function getArticle(articleId) {
  return request({
    url: '/nc/article/' + articleId,
    method: 'get'
  })
}

// 新增文章管理
export function addArticle(data) {
  return request({
    url: '/nc/article',
    method: 'post',
    data: data
  })
}

// 修改文章管理
export function updateArticle(data) {
  return request({
    url: '/nc/article',
    method: 'put',
    data: data
  })
}

// 删除文章管理
export function delArticle(articleId) {
  return request({
    url: '/nc/article/' + articleId,
    method: 'delete'
  })
}
