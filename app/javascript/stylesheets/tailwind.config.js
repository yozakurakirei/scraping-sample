module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),   //追加
    require('@tailwindcss/typography'),  //追加
    require('@tailwindcss/aspect-ratio'),   //追加
  ],
}
