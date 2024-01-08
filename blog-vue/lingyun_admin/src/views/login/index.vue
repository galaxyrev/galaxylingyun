<template>
    <div class="login">
        <el-form ref="ruleFormRef" :model="loginForm" :rules="rules" class="login-form">
            <i class="top"></i><i class="bottom"></i>
            <el-avatar class="logo" src="https://static.galaxylingyun.top/config/logo.png"></el-avatar>
            <h3 class="title">灵韵BLOG后台管理 | 欢迎您</h3>
            <el-form-item prop="username">
                <el-input v-model="loginForm.username" type="text" size="large" placeholder="用户名">
                    <template #prefix><svg-icon icon-class="user" color="#00afff"></svg-icon></template>
                </el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input v-model="loginForm.password" type="password" show-password size="large" placeholder="密码"
                    @keyup.enter="handleLogin(ruleFormRef)">
                    <template #prefix><svg-icon icon-class="password" color="#00afff"></svg-icon></template>
                </el-input>
            </el-form-item>
            <el-form-item>
                <el-button :loading="loading" type="primary" @click.prevent="handleLogin(ruleFormRef)" class="buttonlogin">
                    <span v-if="!loading">登 录</span>
                    <span v-else>登 录中...</span>
                </el-button>
            </el-form-item>
        </el-form>
        <!--  底部  -->
        <div class="el-login-footer">
            <p>Copyright © 2023 - {{ new Date().getFullYear() }} By Galaxy灵韵</p>
            <a href="https://beian.miit.gov.cn/" target="_blank">蜀ICP备2023007531号</a>
        </div>
    </div>
</template>

<script setup lang="ts">
import router from "@/router";
import useStore from '@/store';
import { FormInstance, FormRules } from 'element-plus';
import { reactive, ref } from 'vue';
const { user } = useStore();
const ruleFormRef = ref<FormInstance>();
const loading = ref(false);
const loginForm = reactive({
    username: "test@qq.com",
    password: "123456",
});
const rules = reactive<FormRules>({
    username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
    password: [{ required: true, message: "请输入密码", trigger: "blur" }, { min: 6, message: "密码不能少于6位", trigger: "blur" }],
});
const handleLogin = async (formEl: FormInstance | undefined) => {
    if (!formEl) return;
    await formEl.validate((valid) => {
        if (valid) {
            loading.value = true;
            user.LogIn(loginForm).then(() => {
                router.push({ path: "/" });
                loading.value = false;
            }).catch(() => {
                loading.value = false;
            });
        } else {
            return false;
        }
    })
}
</script>
<style lang="scss" scoped>
.login {
    display: flex;
    text-align: center;
    justify-content: center;
    align-items: center;
    padding: 0 6px 0 6px;
    height: 100%;
    background-image: url("https://static.galaxylingyun.top/resource/login.jpg");
    background-size: cover;
}

.title {
    margin: 0px auto 30px auto;
    text-align: center;
    background: linear-gradient(to right, red, yellow, lime, aqua, blue, fuchsia);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: hue 6s infinite;
}
@keyframes hue {
    from {
        filter: hue-rotate(0deg);
    }
    to {
        filter: hue-rotate(360deg);
    }
}
.login-form {
    border-radius: 6px;
    background: rgba(10, 10, 10, 0.5);
    width: 436px;
    height: 310px;
    padding: 25px 25px 5px 25px;
    border: 1px solid #74efff;
    position: relative;
    overflow: hidden;

    .el-input {
        height: 40px;

        input {
            height: 40px;
        }
    }
    .buttonlogin {
        width: 100%;
        font-size: 16px;
        background-image: linear-gradient(to right, rgb(60, 156, 219), rgb(54, 221, 179),rgb(69, 245, 236));
    }
    .buttonlogin:hover {
        background-image: linear-gradient(to bottom, rgb(60, 156, 219), rgb(54, 221, 179),rgb(69, 245, 236));
    }
    &::before {
        content: ' ';
        position: absolute;
        width: 4px;
        height: 100%;
        top: -100%;
        left: 0;
        background-image: linear-gradient(0deg,
                transparent,
                #ff74ba,
                transparent);
        animation: two 4s linear infinite;
    }

    &::after {
        content: ' ';
        position: absolute;
        width: 4px;
        height: 100%;
        bottom: -100%;
        right: 0;
        background-image: linear-gradient(360deg,
                transparent,
                #74efff,
                transparent);
        animation: four 4s linear 2s infinite;
    }

    i {
        position: absolute;
        display: inline-block;
        height: 4px;
        width: 100%;
    }
    .logo {
        background: rgba(255, 255, 255, 0);;
    }
    .bottom {
        bottom: 0;
        left: -100%;
        background-image: linear-gradient(270deg,
                transparent,
                #b574ff,
                transparent);
        animation: one 4s linear 1s infinite;
    }

    .top {
        top: 0;
        right: -100%;
        background-image: linear-gradient(270deg,
                transparent,
                #74ff97,
                transparent);
        animation: three 4s linear 3s infinite;
    }

    @keyframes one {
        0% {
            left: -100%;
        }

        50%,
        100% {
            left: 100%;
        }
    }

    @keyframes two {
        0% {
            top: -100%;
        }

        50%,
        100% {
            top: 100%;
        }
    }

    @keyframes three {
        0% {
            right: -100%;
        }

        50%,
        100% {
            right: 100%;
        }
    }

    @keyframes four {
        0% {
            bottom: -100%;
        }

        50%,
        100% {
            bottom: 100%;

        }
    }
}
    .login-tip {
        font-size: 13px;
        text-align: center;
        color: #bfbfbf;
    }

    .el-login-footer {
        height: 60px;
        position: fixed;
        bottom: 6px;
        width: 100%;
        text-align: center;
        color: #fff;
        font-family: Arial;
        font-size: 12px;
        letter-spacing: 1px;
    }
</style>