import request from '@/utils/request'

// 查询报名记录列表
export function listEnroll(query) {
  return request({
    url: '/nc/enroll/list',
    method: 'get',
    params: query
  })
}

// 查询报名记录详细
export function getEnroll(enrollId) {
  return request({
    url: '/nc/enroll/' + enrollId,
    method: 'get'
  })
}

// 新增报名记录
export function addEnroll(data) {
  return request({
    url: '/nc/enroll',
    method: 'post',
    data: data
  })
}

// 修改报名记录
export function updateEnroll(data) {
  return request({
    url: '/nc/enroll',
    method: 'put',
    data: data
  })
}

// 删除报名记录
export function delEnroll(enrollId) {
  return request({
    url: '/nc/enroll/' + enrollId,
    method: 'delete'
  })
}
