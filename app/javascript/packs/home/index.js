import Vue from 'vue'
import HomeIndexView from 'views/home/index';
import BootstrapVue from 'bootstrap-vue';

Vue.use(BootstrapVue);
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(HomeIndexView)
  }).$mount();
  document.body.appendChild(app.$el)
  console.log(app)
})