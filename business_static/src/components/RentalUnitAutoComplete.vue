<template>
  <el-form-item :label="label" :prop="prop">
    <el-select
      class="select-width-100"
      v-model="unitId"
      clearable
      filterable
      :placeholder="placeholder"
      @change="select"
    >
      <el-option
        v-for="{ id, unitNo } in rentalUnits"
        class='select-option-selected'
        :value="id"
        :label="unitNo"
        :key="id"
      />
    </el-select>
  </el-form-item>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'RentalUnitAutoComplete',
  props: {
    label: {
      type: String,
      default: '租赁单元：',
    },
    placeholder: {
      type: String,
      default: '请选择租赁单元',
    },
    autoClear: {
      type: Boolean,
      default: false,
    },
    prop: String,
    id: Number,
    assetId: Number,
  },
  data () {
    return {
      unitId: ''
      // rentalUnits: []
    }
  },
  computed: mapState(['rentalUnits']),
  watch: {
    id (id) {
      this.unitId = id
    },
    assetId (assetId) {
      if (assetId) {
        this.fetchUnit()
      } else {
        this.$store.dispatch('setRentalUnits', { assetId: assetId })
      }
      if (this.autoClear) {
        this.unitId = null
        this.$emit('select', {})
      }
    },
  },
  methods: {
    fetchUnit () {
      this.$store.dispatch('setRentalUnits', { assetId: this.assetId })
    },
    select (value) {
      const unit = this.rentalUnits.find(({ id }) => id === value) || {}
      this.$emit('select', unit)
    }
  },
  activated () {
    // this.rentalUnits = this.$store.state.rentalUnits
  }
}
</script>
