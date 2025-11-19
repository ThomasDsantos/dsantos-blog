<template>
  <div>
    <!-- Hero Section -->
    <UContainer class="py-16 md:py-24">
      <div class="max-w-3xl mx-auto text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">
          Salut, je suis <span class="text-primary">Thomas Dsantos</span>
        </h1>
        <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 mb-8">
          Développeur Full-Stack passionné par la création d'applications web modernes et performantes.
        </p>
        <div class="flex items-center justify-center gap-4">
          <UButton
            to="/portfolio"
            size="lg"
            icon="i-heroicons-briefcase"
          >
            Voir mon portfolio
          </UButton>
          <UButton
            to="/blog"
            size="lg"
            variant="outline"
            icon="i-heroicons-document-text"
          >
            Lire le blog
          </UButton>
        </div>
      </div>
    </UContainer>

    <!-- About Section -->
    <UContainer class="py-16 border-t border-gray-200 dark:border-gray-800">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-3xl font-bold mb-8">À propos de moi</h2>
        <div class="grid md:grid-cols-2 gap-8">
          <div>
            <p class="text-gray-600 dark:text-gray-400 mb-4">
              Je suis un développeur passionné avec plusieurs années d'expérience dans le développement web.
              Je me spécialise dans les technologies modernes comme Vue.js, Nuxt, React et Node.js.
            </p>
            <p class="text-gray-600 dark:text-gray-400">
              J'aime créer des expériences utilisateur exceptionnelles et des applications performantes.
              Je partage régulièrement mes connaissances à travers mon blog et je contribue à l'open source.
            </p>
          </div>
          <div>
            <h3 class="font-semibold mb-4">Technologies que j'utilise</h3>
            <div class="flex flex-wrap gap-2">
              <UBadge v-for="tech in technologies" :key="tech" size="lg" variant="subtle">
                {{ tech }}
              </UBadge>
            </div>
          </div>
        </div>
      </div>
    </UContainer>

    <!-- Latest Posts Section -->
    <UContainer class="py-16 border-t border-gray-200 dark:border-gray-800">
      <div class="max-w-4xl mx-auto">
        <div class="flex items-center justify-between mb-8">
          <h2 class="text-3xl font-bold">Derniers articles</h2>
          <UButton
            to="/blog"
            variant="ghost"
            trailing-icon="i-heroicons-arrow-right"
          >
            Voir tous les articles
          </UButton>
        </div>
        <div class="grid md:grid-cols-2 gap-6">
          <UCard
            v-for="article in latestArticles"
            :key="article._path"
            class="hover:shadow-lg transition-shadow"
          >
            <template #header>
              <h3 class="text-xl font-semibold">{{ article.title }}</h3>
            </template>
            <p class="text-gray-600 dark:text-gray-400 line-clamp-3">
              {{ article.description }}
            </p>
            <template #footer>
              <div class="flex items-center justify-between">
                <span class="text-sm text-gray-500">{{ formatDate(article.date) }}</span>
                <UButton
                  :to="article._path"
                  variant="ghost"
                  trailing-icon="i-heroicons-arrow-right"
                >
                  Lire plus
                </UButton>
              </div>
            </template>
          </UCard>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const technologies = [
  'Vue.js',
  'Nuxt',
  'TypeScript',
  'React',
  'Node.js',
  'Tailwind CSS',
  'PostgreSQL',
  'Docker'
]

const { data: latestArticles } = await useAsyncData('latest-articles', () =>
  queryContent('/blog')
    .sort({ date: -1 })
    .limit(4)
    .find()
)

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}
</script>
