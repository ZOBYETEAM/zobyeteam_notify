const app = Vue.createApp({
    data() {
        return {
            currentNotify: [],
            currentTwitterNotify: []
        }
    },
    methods: {
        iconColor(type) {
            if (type === 'success') return 'linear-gradient(to right, #1d976c, #93f9b9)';
            if (type === 'warning') return 'linear-gradient(145deg, rgb(255, 42, 42), rgb(131, 5, 5))';
            return 'linear-gradient(145deg, rgb(69, 203, 247), rgb(12, 74, 131))';
        }
    },
}).mount('.wrapper');

window.addEventListener('message', ({ data }) => {
    if (data.action === 'send') {
        data.key = app.currentNotify.length

        app.currentNotify.unshift(data)

        setTimeout(() => {
            let index = app.currentNotify.findIndex((item) => item.key == data.key);
            app.currentNotify.splice(index, 1)
        }, data.time);
    } else if (data.action === 'sendTwitter') {
        data.key = app.currentTwitterNotify.length

        app.currentTwitterNotify.unshift(data)

        setTimeout(() => {
            let index = app.currentTwitterNotify.findIndex((item) => item.key == data.key);
            app.currentTwitterNotify.splice(index, 1)
        }, data.time);
    } else if (data.action === 'openDisplay') {
        if (data.type === 'twitter') {
            app.twitterDisplay = true;
        }
    } else if (data.action === 'closeDisplay') {
        if (data.type === 'twitter') {
            app.twitterDisplay = false;
        }
    }
});