import React from 'react';

export default function Home() {
  return (
    <div className="space-y-8">
      <section className="card">
        <h2 className="heading">Bem-vindo à ColabKids</h2>
        <p className="mb-4">
          Uma plataforma educacional projetada para crianças aprenderem de forma divertida e interativa.
        </p>
        <button className="btn-primary">Começar agora</button>
      </section>
      
      <section className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="card">
          <h3 className="subheading">Aprendizado Interativo</h3>
          <p>Atividades divertidas que estimulam o desenvolvimento cognitivo.</p>
        </div>
        <div className="card">
          <h3 className="subheading">Conteúdo Educacional</h3>
          <p>Material alinhado com diretrizes pedagógicas modernas.</p>
        </div>
        <div className="card">
          <h3 className="subheading">Acompanhamento de Progresso</h3>
          <p>Monitore o desenvolvimento da criança em tempo real.</p>
        </div>
      </section>
    </div>
  );
} 