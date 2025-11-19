<template>
  <UDropdown :items="languageItems" :popper="{ placement: 'bottom-end' }">
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
  </UDropdown>
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
      click: () => {
        setLocale('en')
        navigateTo(switchLocalePath('en'))
      }
    },
    {
      label: 'Français',
      icon: 'i-flag-fr-4x3',
      click: () => {
        setLocale('fr')
        navigateTo(switchLocalePath('fr'))
      }
    }
  ]
])
</script>
