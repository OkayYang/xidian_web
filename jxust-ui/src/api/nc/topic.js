import request from '@/utils/request'

// 查询讨论话题列表
export function listTopic(query) {
  return request({
    url: '/nc/topic/list',
    method: 'get',
    params: query
  })
}

// 查询讨论话题详细
export function getTopic(topicId) {
  return request({
    url: '/nc/topic/' + topicId,
    method: 'get'
  })
}

// 新增讨论话题
export function addTopic(data) {
  return request({
    url: '/nc/topic',
    method: 'post',
    data: data
  })
}

// 修改讨论话题
export function updateTopic(data) {
  return request({
    url: '/nc/topic',
    method: 'put',
    data: data
  })
}

// 删除讨论话题
export function delTopic(topicId) {
  return request({
    url: '/nc/topic/' + topicId,
    method: 'delete'
  })
}
