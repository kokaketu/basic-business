import { map } from 'lodash-es'

export default {
  // payerNamesLabel: ({payerNames}) => map(payerNames, (value) => ({ value })),
  subjectNamesLabel: ({subjectNames}) => map(subjectNames, (subject) => {
    subject.value = subject.subjectName
    return subject
  }),
  userInfo: state => state.userInfo
}
