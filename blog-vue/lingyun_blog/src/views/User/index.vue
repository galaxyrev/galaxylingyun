<template>
    <div class="page-header">
        <h1 class="page-title">个人中心</h1>
        <img class="page-cover"
            src="https://static.galaxylingyun.top/resource/index6.jpg" alt="">
        <Waves></Waves>
    </div>
    <div class="bg">
        <div class="page-container">
            <div class="title">基本信息</div>
            <div class="info-container">
                <user-avatar class="avatar"></user-avatar>
                <div class="info mt-4">
                    <n-form label-align="left" :label-width="80" :model="userForm">
                        <n-form-item label="昵称" path="nickname">
                            <n-input placeholder="输入您的昵称" v-model:value="userForm.nickname" />
                        </n-form-item>
                        <n-form-item label="个人网站" path="website">
                            <n-input placeholder="请输入个人网站" v-model:value="userForm.webSite" />
                        </n-form-item>
                        <n-form-item label="简介" path="intro">
                            <n-input placeholder="介绍一下自己吧" v-model:value="userForm.intro" />
                        </n-form-item>
                        <n-form-item label="邮箱" path="email">
                            <n-input-group>
                                <n-input placeholder="请输入邮箱" disabled v-model:value="user.email"></n-input>
                                <n-button color="#49b1f5" v-if="user.email" @click="app.emailFlag = true">
                                    修改邮箱
                                </n-button>
                                <n-button color="#49b1f5" v-else @click="app.emailFlag = true">
                                    绑定邮箱
                                </n-button>
                            </n-input-group>
                        </n-form-item>
                    </n-form>
                    <n-button color="#039dcc" @click="handleUpdate">
                        修改
                    </n-button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { updateUserInfo } from "@/api/user";
import { UserInfo } from "@/api/user/types";
import useStore from "@/store";
const { user, app } = useStore();
const router = useRouter();
const userForm = ref<UserInfo>({
    nickname: user.nickname,
    intro: user.intro,
    webSite: user.webSite,
});
const handleUpdate = () => {
    updateUserInfo(userForm.value).then(({ data }) => {
        if (data.flag) {
            user.updateUserInfo(userForm.value);
            window.$message?.success("修改成功");
        }
    });
};
onMounted(() => {
    if (!user.id) {
        router.push("/");
    }
})
</script>

<style lang="scss" scoped>
@import "@/assets/styles/mixin.scss";

.title {
    font-size: 1.25rem;
    font-weight: 700;
}

.info-container {
    @include flex;
    flex-wrap: wrap;
    margin-top: 1rem;

    .avatar {
        display: inline-flex;
        width: 230px;
        height: 140px;
    }

    .info {
        width: 530px;
    }
}

@media (max-width: 850px) {
    .avatar {
        justify-content: center;
    }
}
</style>