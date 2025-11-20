<template>
  <UDropdownMenu :items="languageItems" :popper="{ placement: 'bottom-end' }" @select="handleLanguageChange">
    <UButton
      :icon="currentLocale === 'en' ? 'i-flag-us-4x3' : 'i-flag-fr-4x3'"
      variant="ghost"
      color="gray"
      :aria-label="$t('common.language')"
    />

    <template #item="{ item }">
      <div class="flex items-center gap-2">
        <UIcon :name="item.icon" class="w-5 h-5" />
        <span>{{ item.label }}</span>
      </div>
    </template>
  </UDropdownMenu>
</template>

<script setup lang="ts">
const { locale, locales, setLocale } = useI18n()
const switchLocalePath = useSwitchLocalePath()

const currentLocale = computed(() => locale.value)

const languageItems = computed(() => [
  [
    {
      label: 'English',
      icon: 'i-flag-us-4x3',
      value: 'en'
    },
    {
      label: 'Français',
      icon: 'i-flag-fr-4x3',
      value: 'fr'
    }
  ]
])

const handleLanguageChange = (item: any) => {
  if (item.value) {
    setLocale(item.value)
    navigateTo(switchLocalePath(item.value))
  }
}
</script>
