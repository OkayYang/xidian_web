import request from '@/utils/request'

// 查询发布比赛列表
export function listContest(query) {
  return request({
    url: '/nc/contest/list',
    method: 'get',
    params: query
  })
}

// 查询发布比赛详细
export function getContest(contestId) {
  return request({
    url: '/nc/contest/' + contestId,
    method: 'get'
  })
}

// 新增发布比赛
export function addContest(data) {
  return request({
    url: '/nc/contest',
    method: 'post',
    data: data
  })
}

// 修改发布比赛
export function updateContest(data) {
  return request({
    url: '/nc/contest',
    method: 'put',
    data: data
  })
}

// 删除发布比赛
export function delContest(contestId) {
  return request({
    url: '/nc/contest/' + contestId,
    method: 'delete'
  })
}
