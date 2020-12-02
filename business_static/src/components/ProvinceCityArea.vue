<template>
    <div
        class="wrapper"
        v-loading="Loading"
        element-loading-spinner="el-icon-loading"
        @touchstart.prevent="ListTouchStart"
        @touchmove.prevent="ListTouchMove"
        @touchend.prevent="ListTouchEnd"
    >
        <div ref="wrapper">
            <div
                v-for="(item, index) in List"
                :key="index"
                class="list"
                :class="index == Selected ? 'active' : index == Selected + 1 || index == Selected - 1 ? 'small' : 'smaller'"
            >
                {{ item.text }}
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        List: {
            type: Array,
            default: () => []
        },
        Loading: {
            type: Boolean,
            default: false
        }
    },
    data() {
        return {
            touch: { scrollY: 0 },
            Selected: 0,
            HEIGHT: 30
        };
    },
    methods: {
        reset() {
            this.touch = { scrollY: 0, oldY: 0, deltaY: 0 }
            this.Selected = 0
            this.$refs.wrapper.style['transform'] = `translateY(0px)`
        },
        changeIndex() {
            this.touch.scrollY = this.Selected * 30;
            this.$refs.wrapper.style['transform'] = `translateY(` + this.touch.scrollY + 'px)';
        },
        limit(scrollY, pageY) {
            if (scrollY > 0) {
                this.touch.startY = pageY;
                return true;
            } else if (scrollY < -this.touch.offsetHeight) {
                this.$refs.wrapper.style['transform'] = `translateY(` + -this.touch.offsetHeight + 'px)';
                this.touch.startY = pageY;
                return true;
            }
        },
        ListTouchStart(e) {
            const touch = e.touches[0];
            this.touch.startY = touch.pageY;
            this.touch.offsetHeight = this.$refs.wrapper.offsetHeight - this.HEIGHT;
        },
        ListTouchMove(e) {
            const touch = e.touches[0];
            const deltaY = touch.pageY - this.touch.startY;
            const scrollY = deltaY - this.Selected * 30;
            if (this.limit(scrollY, touch.pageY)) return;
            this.touch.deltaY = deltaY;
            if (this.touch.deltaY <= -20) {
                this.Selected += 1;
                this.touch.startY -= 20;
                this.changeIndex();
                return;
            } else if (this.touch.deltaY >= 20) {
                this.Selected -= 1;
                this.touch.startY += 20;
                this.changeIndex();
                return;
            }
            this.$refs.wrapper.style['transform'] = `translateY(` + scrollY + 'px)';
        },
        ListTouchEnd(e) {
            this.touch.scrollY = 0 - this.Selected * 30;
            this.$refs.wrapper.style['transform'] = `translateY(` + this.touch.scrollY + 'px)';
            this.$emit('change', this.Selected);
        }
    }
};
</script>

<style scoped="scoped" lang="stylus">
.wrapper
    width 30%
    position relative
    top 60px
    padding 0 5px
    .list
        height 30px
        line-height 30px
        white-space nowrap
        overflow hidden
        text-overflow ellipsis
    .active
        font-size 15px
        color #000000
        font-weight 900
        opacity 1
    .small
        opacity 0.7
        font-size 14px
    .smaller
        opacity 0.3
        font-size 12px
    .el-loading-spinner
    margin-top -70px
</style>