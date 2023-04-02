import request from '@/utils/request'

// 查询话题类别列表
export function listTopicType(query) {
  return request({
    url: '/nc/topicType/list',
    method: 'get',
    params: query
  })
}

// 查询话题类别详细
export function getTopicType(ttId) {
  return request({
    url: '/nc/topicType/' + ttId,
    method: 'get'
  })
}

// 新增话题类别
export function addTopicType(data) {
  return request({
    url: '/nc/topicType',
    method: 'post',
    data: data
  })
}

// 修改话题类别
export function updateTopicType(data) {
  return request({
    url: '/nc/topicType',
    method: 'put',
    data: data
  })
}

// 删除话题类别
export function delTopicType(ttId) {
  return request({
    url: '/nc/topicType/' + ttId,
    method: 'delete'
  })
}
