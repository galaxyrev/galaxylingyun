<template>
    <div class="page-header">
        <h1 class="page-title">{{ photoInfo.albumName }}</h1>
        <img class="page-cover"
            src="https://static.galaxylingyun.top/resource/album.png" alt="">
        <Waves></Waves>
    </div>
    <div class="bg">
        <div class="page-container">
            <div class="photo-container" v-viewer>
                <img class="photo" v-for="photo in photoInfo.photoVOList" :key="photo.id" :src="photo.photoUrl">
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { getPhotoList } from '@/api/album';
import { Photo, PhotoInfo } from '@/api/album/types';

const route = useRoute();
const photoInfo = ref<PhotoInfo>({
    albumName: "",
    photoVOList: [] as Photo[],
});
onMounted(() => {
    getPhotoList(Number(route.params.albumId)).then(({ data }) => {
        photoInfo.value = data.data;
    })
})
</script>

<style lang="scss" scoped>
.page-container {
    background-color: var(--grey-0);
}
.photo-container {
    display: flex;
    flex-wrap: wrap;
}

.photo {
    flex-grow: 1;
    height: 12.5rem;
    margin: 0.1875rem;
    cursor: pointer;
    object-fit: cover;
}

@media (max-width: 567px) {
    .photo {
        width: 100%;
    }
}
</style>