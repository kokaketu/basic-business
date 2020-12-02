import building from './img/building.png'
import agency from './img/icon-agency.png'
import grayRentalRate from './img/icon-grayRentalRate.png'
import income from './img/icon-income.png'
import invest from './img/icon-invest.png'
import mainArea from './img/icon-mainArea.png'
import openingRate from './img/icon-openingRate.png'
import passenger from './img/icon-passenger.png'
import rent from './img/icon-rent.png'
import rentalRate from './img/icon-rentalRate.png'
import valuation from './img/icon-valuation.png'
import sales from './img/iocn-sales.png'

let images = { building, agency, grayRentalRate, mainArea, openingRate }

let icons = [{
  name: '出租率',
  value: '96.00%',
  icon: rentalRate
}, {
  name: '总租金坪效',
  value: '156.07元',
  icon: rent
}, {
  name: '客流量',
  value: '123456人',
  icon: passenger
}, {
  name: '销售额',
  value: '4561654.07元',
  icon: sales
}, {
  name: '投资回报率',
  value: '6.0%',
  icon: invest
}]
let totalReport = [{
  icon: income,
  title: '收入金额',
  type: '同比',
  rate: 2.30,
  value: 1295.48,
  charts: {
    id: 0,
    color: ['#5E0EFF', '#ffffff'],
    data: [820, 932, 901, 934, 1290, 1330, 1320]
  }
}, {
  icon: valuation,
  title: '支出金额',
  type: '环比',
  rate: -2.30,
  value: 1295.48,
  charts: {
    id: 1,
    color: ['#00E4A5', '#ffffff'],
    data: [820, 932, 901, 934, 1290, 1330, 1320]
  }
}, {
  icon: valuation,
  title: '估值',
  type: '环比',
  rate: -2.30,
  value: 1295.48,
  charts: {
    id: 2,
    color: ['#FF4B54', '#ffffff'],
    data: [820, 932, 901, 934, 1290, 1330, 1320]
  }
}]

let incomeTrend = {
  id: 0,
  colors: ['#5E0EFF', '#F5A623'],
  names: ['2019.09', '2019.10', '2019.01', '2019.02', '2019.03', '2019.04', '2019.05', '2019.06', '2019.07', '2019.08', '2019.09', '2019.10'],
  barData: [300, 120, 500, 750, 300, 120, 800, 500, 500, 750, 300, 120],
  lineData: [100, 250, 200, 220, 500, 200, 100, 250, 200, 220, 500, 200]
}
let incomeDistribution = [{id: 0, name: '租金收入', color: '#FF784D', value: 80}, {id: 1, name: '管理收入', color: '#FFBD00', value: 65}, {id: 2, name: '保护费', color: '#663BFF', value: 55}, {id: 3, name: '其他收入', color: '#00E4A5', value: 75}]
export default {
  images,
  icons,
  totalReport,
  incomeTrend,
  incomeDistribution
}
