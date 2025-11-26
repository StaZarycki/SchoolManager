module.exports = {
    content: [
        './app/views/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/javascript/**/*.js'
    ],
    plugins: [
        require("daisyui")
    ],
    daisyui: {
        themes: ["light", "dark"], // lub twoje custom theme
    },
    safelist: [
        'alert-success',
        'alert-error',
        'alert-warning',
        'alert-info'
    ],
}