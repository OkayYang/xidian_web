import request from '@/utils/request'

// 查询评论专区列表
export function listDiscuss(query) {
  return request({
    url: '/nc/discuss/list',
    method: 'get',
    params: query
  })
}

// 查询评论专区详细
export function getDiscuss(discussId) {
  return request({
    url: '/nc/discuss/' + discussId,
    method: 'get'
  })
}

// 新增评论专区
export function addDiscuss(data) {
  return request({
    url: '/nc/discuss',
    method: 'post',
    data: data
  })
}

// 修改评论专区
export function updateDiscuss(data) {
  return request({
    url: '/nc/discuss',
    method: 'put',
    data: data
  })
}

// 删除评论专区
export function delDiscuss(discussId) {
  return request({
    url: '/nc/discuss/' + discussId,
    method: 'delete'
  })
}
