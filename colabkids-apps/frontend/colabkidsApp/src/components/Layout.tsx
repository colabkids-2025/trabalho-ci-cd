import React from 'react';
import Head from 'next/head';

interface LayoutProps {
  children: React.ReactNode;
  title?: string;
}

const Layout: React.FC<LayoutProps> = ({ children, title = 'ColabKids' }) => {
  return (
    <div className="flex flex-col min-h-screen">
      <Head>
        <title>{title}</title>
        <meta name="description" content="ColabKids - Plataforma educacional" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      
      <header className="bg-background-light py-4 shadow-md">
        <div className="container-colabkids flex justify-between items-center">
          <h1 className="text-2xl font-bold text-primary">ColabKids</h1>
          {/* Menu simplificado sem links */}
          <div className="flex items-center space-x-2">
            <button className="btn-secondary text-sm py-1 px-3">Entrar</button>
          </div>
        </div>
      </header>
      
      <main className="container-colabkids py-8 flex-grow">
        {children}
      </main>
      
      <footer className="bg-background-light py-4">
        <div className="container-colabkids text-center text-text-muted">
          <p>© {new Date().getFullYear()} ColabKids. Todos os direitos reservados.</p>
        </div>
      </footer>
    </div>
  );
};

export default Layout; 