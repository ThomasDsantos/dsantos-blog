// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },

  modules: [
    '@nuxt/ui',
    '@nuxt/content'
  ],

  content: {
    highlight: {
      theme: {
        default: 'github-light',
        dark: 'github-dark'
      }
    }
  },

  colorMode: {
    preference: 'light'
  }
})
