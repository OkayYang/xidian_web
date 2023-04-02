import request from '@/utils/request'

// 查询文章类目列表
export function listType(query) {
  return request({
    url: '/nc/type/list',
    method: 'get',
    params: query
  })
}

// 查询文章类目详细
export function getType(atId) {
  return request({
    url: '/nc/type/' + atId,
    method: 'get'
  })
}

// 新增文章类目
export function addType(data) {
  return request({
    url: '/nc/type',
    method: 'post',
    data: data
  })
}

// 修改文章类目
export function updateType(data) {
  return request({
    url: '/nc/type',
    method: 'put',
    data: data
  })
}

// 删除文章类目
export function delType(atId) {
  return request({
    url: '/nc/type/' + atId,
    method: 'delete'
  })
}
