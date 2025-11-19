<template>
  <header class="border-b border-gray-200 dark:border-gray-800">
    <UContainer>
      <nav class="flex items-center justify-between py-4">
        <NuxtLink to="/" class="text-xl font-bold"> Thomas Dsantos </NuxtLink>

        <ul class="flex items-center gap-6">
          <li>
            <UButton to="/" variant="ghost" color="gray">
              {{ $t('nav.home') }}
            </UButton>
          </li>
          <li>
            <UButton to="/blog" variant="ghost" color="gray">
              {{ $t('nav.blog') }}
            </UButton>
          </li>
          <li>
            <UButton to="/portfolio" variant="ghost" color="gray">
              {{ $t('nav.portfolio') }}
            </UButton>
          </li>
          <li>
            <UButton
              :icon="colorMode.value === 'dark' ? 'i-heroicons-sun' : 'i-heroicons-moon'"
              variant="ghost"
              color="gray"
              aria-label="Toggle dark mode"
              @click="toggleDark"
            />
          </li>
          <li>
            <LanguageSwitcher />
          </li>
        </ul>
      </nav>
    </UContainer>
  </header>
</template>

<script setup lang="ts">
const colorMode = useColorMode()

const toggleDark = () => {
  colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark'
}
</script>
