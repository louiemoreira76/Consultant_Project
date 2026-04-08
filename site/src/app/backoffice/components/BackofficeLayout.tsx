import { ReactNode } from 'react';
import { Sidebar } from './Sidebar';
import { Header } from './Header';

interface BackofficeLayoutProps {
  children: ReactNode;
  activeItem?: string;
}

export function BackofficeLayout({ children, activeItem }: BackofficeLayoutProps) {
  return (
    <div className="min-h-screen bg-[#F0F4F8] font-[Inter,sans-serif]">
      <Sidebar activeItem={activeItem} />

      <div className="ml-64">
        <Header />

        <main className="p-8">
          {children}
        </main>
      </div>
    </div>
  );
}
