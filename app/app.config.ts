export default defineAppConfig({
  ui: {
    colors: {
      primary: 'teal',
      neutral: 'gray',
    },
    typography: {
      fontFamily: 'Arial, sans-serif',
      fontSize: '16px',
    },
    borders: {
      radius: '8px',
      width: '2px',
    },
    button: {
      slots: {
        base: [
          'cursor-pointer',
        ],
      },
    },
  },
})
