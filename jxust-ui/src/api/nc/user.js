import request from '@/utils/request'

// 查询用户管理列表
export function listUser(query) {
  return request({
    url: '/nc/user/list',
    method: 'get',
    params: query
  })
}

// 查询用户管理详细
export function getUser(uid) {
  return request({
    url: '/nc/user/' + uid,
    method: 'get'
  })
}

// 新增用户管理
export function addUser(data) {
  return request({
    url: '/nc/user',
    method: 'post',
    data: data
  })
}

// 修改用户管理
export function updateUser(data) {
  return request({
    url: '/nc/user',
    method: 'put',
    data: data
  })
}

// 删除用户管理
export function delUser(uid) {
  return request({
    url: '/nc/user/' + uid,
    method: 'delete'
  })
}
