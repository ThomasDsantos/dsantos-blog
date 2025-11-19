// @ts-check
import eslintConfigPrettier from 'eslint-config-prettier'
import pluginVue from 'eslint-plugin-vue'
import vueParser from 'vue-eslint-parser'

export default [
  {
    ignores: ['.nuxt', '.output', 'dist', 'node_modules', '.git', 'pnpm-lock.yaml']
  },
  ...pluginVue.configs['flat/recommended'],
  {
    files: ['**/*.vue'],
    languageOptions: {
      parser: vueParser,
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        parser: '@typescript-eslint/parser'
      }
    },
    rules: {
      'vue/multi-word-component-names': 'off',
      'vue/no-v-html': 'warn'
    }
  },
  {
    files: ['**/*.ts', '**/*.tsx', '**/*.js', '**/*.mjs'],
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
        // Node.js globals
        process: 'readonly',
        Buffer: 'readonly',
        __dirname: 'readonly',
        __filename: 'readonly',
        // Browser globals
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        // Vue/Nuxt globals
        defineNuxtConfig: 'readonly',
        definePageMeta: 'readonly',
        defineNuxtComponent: 'readonly',
        useHead: 'readonly',
        useRoute: 'readonly',
        useRouter: 'readonly',
        useAsyncData: 'readonly',
        useFetch: 'readonly',
        queryContent: 'readonly',
        navigateTo: 'readonly',
        useI18n: 'readonly',
        useSwitchLocalePath: 'readonly',
        useColorMode: 'readonly',
        createError: 'readonly',
        defineAppConfig: 'readonly',
        computed: 'readonly'
      }
    },
    rules: {
      'no-console': 'warn',
      'no-debugger': 'warn',
      'no-unused-vars': [
        'warn',
        {
          argsIgnorePattern: '^_',
          varsIgnorePattern: '^_'
        }
      ]
    }
  },
  eslintConfigPrettier
]
