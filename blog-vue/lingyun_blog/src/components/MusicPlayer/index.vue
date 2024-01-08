<template>
    <meting-js v-if="blog.siteConfig.isMusic" server="netease" type="playlist" :id="blog.siteConfig.musicId"
        fixed="true" theme="#49b1f5"></meting-js>
</template>

<script setup lang="ts">
import useStore from "@/store";
const { blog } = useStore();
</script>

<style scoped>

</style>