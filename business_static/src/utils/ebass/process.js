import { Message, MessageBox } from 'element-ui'
import { isEbaasUser, getEbaasToken, getChainData, updateChain } from '@/http/ebaas'

const EBaasFunc = function () {

}

EBaasFunc.prototype = {
  init: async function(params = {}, callback) {
    this.chainParams = params;
    this.callback = callback
    if(this.judgeBrowser()) { //判断是不是ebaas浏览器
      // const isEbaasMember = await isEbaasUser()
      // if(isEbaasMember) { //判断是不是ebaas用户
      //   const ebaasToken = await getEbaasToken({merchantId: params.merchantId})
      //   if(ebaasToken) {
      //     this.ebaasPre(ebaasToken);
      //   }
      // } else {
      //   Message.warning('您还不是Ebaas用户');
      // }
      const ebaasToken = await getEbaasToken({merchantId: params.merchantId})
      if(ebaasToken) {
        this.ebaasPre(ebaasToken);
      }
    } else {
      this.downloadBrowser()
    }
  },
  // 初始化和上链
  ebaasPre: async function(ebaasToken) {
    const {id , dataType, merchantId} = this.chainParams
    const data = await getChainData({id , dataType, merchantId});
    if (!data) {
      return;
    }
    if (localStorage.getItem('isInitSdk')) {
      //已经初始化过了，直接上链
      this.cochainTip(ebaasToken, data);
    } else {
      const { id, dataType } = data;
      // 初始化SDK
      window.EBAASSDK.initSdk({
        ebaasToken,
        id, // 业务方相关ID
        dataType, // 业务方数据类型
        callback: (result) => {
          const { code } = result;
          if (+code === 200) {
            localStorage.setItem('isInitSdk', 'yes');
            // 上传数据
            this.cochainTip(ebaasToken, data);
          } else {
            //清掉缓存
            this.clearStorage();
          }
        },
      });
    }
  },
  cochainTip(ebaasToken, data) {
    MessageBox.confirm('请谨慎上链，上链后的资料不可篡改，记录在区块链中', '提示', {
      confirmButtonText: '确认上链',
      cancelButtonText: '取消'
    }).then(() => {
      setTimeout(()=> {
        this.cochain(ebaasToken, data);
      },500)
    }).catch(() => {});
  },
  // 上链
  cochain: async function(ebaasToken, data) {
    const {
      id,
      dataType,
      excludeFields,
      invokeDataDesc,
      method,
      ebaasUserId,
      encryptPolicy,
      whiteList,
    } = data;

    window.EBAASSDK.cochain({
      ebaasToken,
      describe: {
        excludeFields,
        invokeDataDesc,
        method,
        id,
        dataType,
        ebaasUserId,
        encryptPolicy,
        whiteList,
      },
      data: data.chainData,
      callback: (result) => {
        if (+result.code === 200) {
          Message.success('上链操作成功')
          let params = { ...data.callbackParam, chainKey: result.data.data.chainKey || '' }
          params.chainKey && this.updateChainStatu(params)
          this.callback && this.callback()
        } else {
          this.clearStorage();
        }
      },
    });
  },
  // 更新数据上链状态
  updateChainStatu: function(data) {
    updateChain(data || {}).then((res) => {
      console.log(res);
    });
  },
  // 判断是不是ebaas浏览器
  judgeBrowser: function() {
    const { userAgent } = window.navigator;
    return userAgent.indexOf('ebaas-browser') > -1;
  },
  downloadBrowser() {
    MessageBox.confirm('请下载EBaaS区块链浏览器进行上链', '', {
      confirmButtonText: '前往下载',
      cancelButtonText: '取消'
    }).then(() => {
      setTimeout(()=> {
        window.open('https://www.ebaas.com', '_blank')
      },500)
    }).catch(() => {
             
    });
  },
  // 清除 localStorage
  clearStorage: () => {
    localStorage.getItem('isInitSdk') && localStorage.removeItem('isInitSdk')
  }
}
export const ebaasProcess = new EBaasFunc()
