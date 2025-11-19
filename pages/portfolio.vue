<template>
  <div>
    <UContainer class="py-16">
      <div class="max-w-4xl mx-auto">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Portfolio</h1>
        <p class="text-lg text-gray-600 dark:text-gray-400 mb-12">
          Découvrez mes projets et réalisations.
        </p>

        <!-- Projects Grid -->
        <div class="grid md:grid-cols-2 gap-8">
          <UCard
            v-for="project in projects"
            :key="project.title"
            class="hover:shadow-lg transition-shadow"
          >
            <template #header>
              <div class="aspect-video bg-gradient-to-br from-primary-400 to-primary-600 rounded-lg mb-4 flex items-center justify-center">
                <UIcon :name="project.icon" class="w-16 h-16 text-white" />
              </div>
              <h3 class="text-xl font-semibold">{{ project.title }}</h3>
            </template>
            <p class="text-gray-600 dark:text-gray-400 mb-4">
              {{ project.description }}
            </p>
            <div class="flex flex-wrap gap-2 mb-4">
              <UBadge
                v-for="tech in project.technologies"
                :key="tech"
                size="sm"
                variant="subtle"
              >
                {{ tech }}
              </UBadge>
            </div>
            <template #footer>
              <div class="flex items-center gap-2">
                <UButton
                  v-if="project.link"
                  :to="project.link"
                  target="_blank"
                  variant="outline"
                  icon="i-heroicons-arrow-top-right-on-square"
                >
                  Voir le projet
                </UButton>
                <UButton
                  v-if="project.github"
                  :to="project.github"
                  target="_blank"
                  variant="ghost"
                  icon="i-simple-icons-github"
                >
                  Code source
                </UButton>
              </div>
            </template>
          </UCard>
        </div>

        <!-- Skills Section -->
        <div class="mt-16 pt-16 border-t border-gray-200 dark:border-gray-800">
          <h2 class="text-3xl font-bold mb-8">Compétences</h2>
          <div class="grid md:grid-cols-3 gap-8">
            <div v-for="category in skills" :key="category.name">
              <h3 class="font-semibold mb-4 flex items-center gap-2">
                <UIcon :name="category.icon" class="w-5 h-5" />
                {{ category.name }}
              </h3>
              <div class="flex flex-wrap gap-2">
                <UBadge
                  v-for="skill in category.items"
                  :key="skill"
                  variant="subtle"
                >
                  {{ skill }}
                </UBadge>
              </div>
            </div>
          </div>
        </div>

        <!-- Contact Section -->
        <div class="mt-16 pt-16 border-t border-gray-200 dark:border-gray-800 text-center">
          <h2 class="text-3xl font-bold mb-4">Travaillons ensemble</h2>
          <p class="text-lg text-gray-600 dark:text-gray-400 mb-8">
            Vous avez un projet en tête ? N'hésitez pas à me contacter.
          </p>
          <UButton
            to="mailto:contact@example.com"
            size="lg"
            icon="i-heroicons-envelope"
          >
            Me contacter
          </UButton>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const projects = [
  {
    title: 'E-commerce Platform',
    description: 'Une plateforme e-commerce complète avec gestion des produits, panier et paiement en ligne.',
    icon: 'i-heroicons-shopping-cart',
    technologies: ['Nuxt', 'Vue.js', 'Stripe', 'PostgreSQL'],
    link: 'https://example.com',
    github: 'https://github.com'
  },
  {
    title: 'Dashboard Analytics',
    description: 'Un tableau de bord analytique en temps réel avec visualisation de données complexes.',
    icon: 'i-heroicons-chart-bar',
    technologies: ['React', 'D3.js', 'Node.js', 'MongoDB'],
    link: 'https://example.com',
    github: 'https://github.com'
  },
  {
    title: 'Blog CMS',
    description: 'Un système de gestion de contenu moderne avec éditeur WYSIWYG et prévisualisation en temps réel.',
    icon: 'i-heroicons-document-text',
    technologies: ['Nuxt Content', 'Tailwind CSS', 'Markdown'],
    link: 'https://example.com',
    github: 'https://github.com'
  },
  {
    title: 'API REST',
    description: 'Une API RESTful robuste et scalable avec authentification JWT et documentation Swagger.',
    icon: 'i-heroicons-cloud',
    technologies: ['Node.js', 'Express', 'JWT', 'Swagger'],
    github: 'https://github.com'
  }
]

const skills = [
  {
    name: 'Frontend',
    icon: 'i-heroicons-computer-desktop',
    items: ['Vue.js', 'React', 'Nuxt', 'Next.js', 'TypeScript', 'Tailwind CSS']
  },
  {
    name: 'Backend',
    icon: 'i-heroicons-server',
    items: ['Node.js', 'Express', 'PostgreSQL', 'MongoDB', 'Redis', 'Docker']
  },
  {
    name: 'Outils',
    icon: 'i-heroicons-wrench-screwdriver',
    items: ['Git', 'GitHub', 'VS Code', 'Figma', 'Postman', 'Linux']
  }
]
</script>
