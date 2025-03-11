/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['localhost'],
  },
  i18n: {
    locales: ['pt-BR'],
    defaultLocale: 'pt-BR',
  },
};

export default nextConfig;
