<template>
    <div class="tool" :style="y > 0 ? show : ''">
        <div class="item" v-if="route.meta.title == '文章'" @click="handleSide">
            <svg-icon icon-class="heng" size="1.5rem"></svg-icon>
        </div>
        <div class="item back-to-top" @click="handleBackToTop">
            <svg-icon icon-class="up" size="0.9rem"></svg-icon>
            <span class="count">{{ process }}%</span>
        </div>
    </div>
</template>

<script setup lang="ts">
import useStore from "@/store";
import { useEventListener, useScroll } from "@vueuse/core";
const route = useRoute();
const process = ref(0);
const show = reactive({
    transform: "translateX(-45px)"
});
const { y } = useScroll(window);
const { app } = useStore();
useEventListener(document, "scroll", () => {
    process.value = Number(
        (
            (window.pageYOffset /
                (document.documentElement.scrollHeight - window.innerHeight)) *
            100
        ).toFixed(0)
    )
});
const handleSide = () => {
    app.sideFlag = !app.sideFlag;
};
const handleBackToTop = () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
};
</script>

<style lang="scss" scoped>
@import "@/assets/styles/mixin.scss";

.tool {
    position: fixed;
    right: -40px;
    bottom: 1rem;
    z-index: 9;
    // color: var(--primary-color);
    color: rgb(7, 91, 201);
    box-shadow: 0 0 0.5rem rgb(0 0 0 / 10%);
    background: var(--grey-1-a3);
    transition: all 0.5s;

    .item {
        @include flex;
        flex-direction: column;
        width: 1.9rem;
        padding: 0.3125rem 0 0;
        opacity: 0.6;
        cursor: pointer;
        transition: all 0.2s ease-in-out 0s;

        .count {
            font-size: 0.75em;
        }

        &:hover {
            opacity: 0.9;
        }
    }
}
</style>