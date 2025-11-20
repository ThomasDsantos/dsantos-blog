<template>
  <UDropdownMenu :items="languageItems" :popper="{ placement: 'bottom-end' }">
    <UButton
      :icon="currentLocale.icon || 'i-flag-gb-4x3'"
      variant="ghost"
      color="secondary"
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

const handleLanguageChange = (value: string) => {
  setLocale(value)
  navigateTo(switchLocalePath(value))
}

const languageItems = computed(() => [
    {
      label: 'English',
      icon: 'i-flag-gb-4x3',
      value: 'en',
      onSelect: () => handleLanguageChange('en')
    },
    {
      label: 'Français',
      icon: 'i-flag-fr-4x3',
      value: 'fr',
      onSelect: () => handleLanguageChange('fr')
    }
])

const currentLocale = computed(() => languageItems.value.find((item) => item.value === locale.value) || languageItems.value[0])
</script>
