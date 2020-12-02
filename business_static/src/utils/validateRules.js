export function validateSubjectId (rule, value, callback) {
  if (this.form.subjectId == null || this.form.subjectId === '') {
    callback(new Error('款项名称不能为空'))
  }
  callback()
}

export function validateAssetId (rule, value, callback) {
  if (this.form.assetId == null || this.form.assetId === '') {
    callback(new Error('项目不能为空'))
  }
  callback()
}

export function validateTaxRate (rule, value, callback) {
  if (this.form.taxRate < 0 || this.form.taxRate >= 100) {
    callback(new Error('费率应该大于 0 小于 100'))
  }
  callback()
}

export function validateCompanyId (rule, value, callback) {
  if (this.form.companyId == null || this.form.companyId === '') {
    callback(new Error('付款方不能为空'))
  }
  callback()
}
