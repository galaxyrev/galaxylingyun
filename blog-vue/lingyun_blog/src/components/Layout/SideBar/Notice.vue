<template>
    <div class="side-card">
        <!-- 标题 -->
        <div class="notice-title">
            <svg-icon class="trumpet" icon-class="trumpet" size="1.1875rem" color="#49b1f5"></svg-icon>
            公告
        </div>
        <!-- 公告内容 -->
        <div class="notice-content" v-html="blog.siteConfig.siteNotice"></div>
    </div>
</template>

<script setup lang="ts">
import useStore from "@/store";
const { blog } = useStore();
</script>

<style lang="scss" scoped>
.side-card {
    background-color: var(--grey-0);
}
.notice-title {
    font-size: 1.2em;
    color: #49b1f5;
}

.notice-content {
    font-size: 0.9rem;
    line-height: 1.75rem;
}

.trumpet {
    animation: trumpet-shake 1s linear infinite;
}

@keyframes trumpet-shake {
    0% {

        transform: rotate(-15deg);
    }

    4% {

        transform: rotate(15deg);
    }

    16% {

        transform: rotate(-22deg);
    }

    20% {
        transform: rotate(22deg);
    }

    8%,
    24% {

        transform: rotate(-18deg);
    }

    12%,
    28% {

        transform: rotate(18deg);
    }

    32% {
        transform: rotate(-12deg);
    }

    36% {

        transform: rotate(12deg);
    }

    40%,
    100% {

        transform: rotate(0deg);
    }
}
</style>