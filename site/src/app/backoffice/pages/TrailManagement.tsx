import { useState } from 'react';
import { Sidebar } from '../components/Sidebar';
import { Header } from '../components/Header';
import { TrailListPanel } from '../components/TrailListPanel';
import { ContentPanel } from '../components/ContentPanel';
import { AddTrailModal } from '../components/AddTrailModal';
import { AddContentModal } from '../components/AddContentModal';

// Trail Management Page - Backoffice
interface Trail {
  id: string;
  name: string;
  description: string;
  contentCount: number;
}

interface Content {
  id: string;
  trailId: string;
  type: 'video' | 'pdf';
  title: string;
  description: string;
  uploadDate: string;
  engagementData: number[];
  views: number;
  dropoffPoint: string;
}

// Mock Data
const initialTrails: Trail[] = [
  {
    id: '1',
    name: 'Recuperação de Créditos Tributários',
    description: 'Módulo completo sobre identificação e recuperação de créditos de PIS/COFINS',
    contentCount: 8,
  },
  {
    id: '2',
    name: 'Planejamento Societário',
    description: 'Estratégias avançadas de reestruturação societária para economia tributária',
    contentCount: 5,
  },
  {
    id: '3',
    name: 'ICMS-ST e Substituição Tributária',
    description: 'Guia prático de apuração e gestão de ICMS-ST nas operações interestaduais',
    contentCount: 6,
  },
];

const initialContents: Content[] = [
  {
    id: '1',
    trailId: '1',
    type: 'video',
    title: 'Aula 01 - Introdução ao PIS/COFINS',
    description: 'Fundamentos do regime cumulativo e não-cumulativo',
    uploadDate: '15/03/2026',
    engagementData: [85, 92, 88, 95, 82, 78, 71, 68, 62, 58, 55, 52],
    views: 187,
    dropoffPoint: '42%',
  },
  {
    id: '2',
    trailId: '1',
    type: 'video',
    title: 'Aula 02 - Identificação de Créditos',
    description: 'Como identificar créditos não aproveitados',
    uploadDate: '18/03/2026',
    engagementData: [90, 88, 85, 82, 80, 75, 72, 70, 68, 65, 63, 60],
    views: 165,
    dropoffPoint: '38%',
  },
  {
    id: '3',
    trailId: '1',
    type: 'pdf',
    title: 'Checklist de Documentação PIS/COFINS',
    description: 'Lista completa de documentos necessários',
    uploadDate: '20/03/2026',
    engagementData: [95, 92, 88, 85, 82, 80, 78, 75],
    views: 142,
    dropoffPoint: 'N/A',
  },
  {
    id: '4',
    trailId: '1',
    type: 'video',
    title: 'Aula 03 - Cálculo de Recuperação',
    description: 'Metodologia de cálculo e apuração',
    uploadDate: '22/03/2026',
    engagementData: [88, 85, 82, 78, 75, 70, 65, 60, 55, 50, 48, 45],
    views: 158,
    dropoffPoint: '45%',
  },
  {
    id: '5',
    trailId: '2',
    type: 'video',
    title: 'Reestruturação Societária - Parte 1',
    description: 'Análise de cenários e oportunidades',
    uploadDate: '10/03/2026',
    engagementData: [92, 90, 87, 85, 82, 80, 78, 75, 72, 70],
    views: 134,
    dropoffPoint: '35%',
  },
];

function TrailManagement() {
  const [trails, setTrails] = useState<Trail[]>(initialTrails);
  const [contents, setContents] = useState<Content[]>(initialContents);
  const [selectedTrailId, setSelectedTrailId] = useState<string | null>('1');

  // Modal states
  const [isTrailModalOpen, setIsTrailModalOpen] = useState(false);
  const [isContentModalOpen, setIsContentModalOpen] = useState(false);
  const [contentModalType, setContentModalType] = useState<'video' | 'pdf'>('video');
  const [editingTrail, setEditingTrail] = useState<Trail | null>(null);
  const [editingContent, setEditingContent] = useState<Content | null>(null);

  const selectedTrail = trails.find(t => t.id === selectedTrailId) || null;
  const trailContents = contents.filter(c => c.trailId === selectedTrailId);

  // Trail handlers
  const handleAddTrail = () => {
    setEditingTrail(null);
    setIsTrailModalOpen(true);
  };

  const handleEditTrail = (id: string) => {
    const trail = trails.find(t => t.id === id);
    if (trail) {
      setEditingTrail(trail);
      setIsTrailModalOpen(true);
    }
  };

  const handleDeleteTrail = (id: string) => {
    if (confirm('Tem certeza que deseja excluir esta trilha? Todos os conteúdos associados serão removidos.')) {
      setTrails(trails.filter(t => t.id !== id));
      setContents(contents.filter(c => c.trailId !== id));
      if (selectedTrailId === id) {
        setSelectedTrailId(trails[0]?.id || null);
      }
    }
  };

  const handleSaveTrail = (trailData: Omit<Trail, 'id' | 'contentCount'>) => {
    if (editingTrail) {
      setTrails(trails.map(t =>
        t.id === editingTrail.id
          ? { ...t, name: trailData.name, description: trailData.description }
          : t
      ));
    } else {
      const newTrail: Trail = {
        id: String(Date.now()),
        ...trailData,
        contentCount: 0,
      };
      setTrails([...trails, newTrail]);
      setSelectedTrailId(newTrail.id);
    }
  };

  // Content handlers
  const handleAddVideo = () => {
    setEditingContent(null);
    setContentModalType('video');
    setIsContentModalOpen(true);
  };

  const handleAddPDF = () => {
    setEditingContent(null);
    setContentModalType('pdf');
    setIsContentModalOpen(true);
  };

  const handleEditContent = (id: string) => {
    const content = contents.find(c => c.id === id);
    if (content) {
      setEditingContent(content);
      setContentModalType(content.type);
      setIsContentModalOpen(true);
    }
  };

  const handleReplaceContent = (id: string) => {
    const content = contents.find(c => c.id === id);
    if (content) {
      alert(`Funcionalidade de substituição de arquivo para: ${content.title}\n\nEm desenvolvimento...`);
    }
  };

  const handleDeleteContent = (id: string) => {
    if (confirm('Tem certeza que deseja remover este conteúdo?')) {
      setContents(contents.filter(c => c.id !== id));
      if (selectedTrailId) {
        setTrails(trails.map(t =>
          t.id === selectedTrailId
            ? { ...t, contentCount: t.contentCount - 1 }
            : t
        ));
      }
    }
  };

  const handleSaveContent = (contentData: Omit<Content, 'id' | 'uploadDate' | 'engagementData' | 'views' | 'dropoffPoint' | 'trailId'>) => {
    if (!selectedTrailId) return;

    if (editingContent) {
      setContents(contents.map(c =>
        c.id === editingContent.id
          ? { ...c, title: contentData.title, description: contentData.description }
          : c
      ));
    } else {
      const newContent: Content = {
        id: String(Date.now()),
        trailId: selectedTrailId,
        ...contentData,
        uploadDate: new Date().toLocaleDateString('pt-BR'),
        engagementData: Array.from({ length: 12 }, () => Math.floor(Math.random() * 40) + 60),
        views: Math.floor(Math.random() * 200) + 50,
        dropoffPoint: contentData.type === 'video' ? `${Math.floor(Math.random() * 30) + 30}%` : 'N/A',
      };
      setContents([...contents, newContent]);
      setTrails(trails.map(t =>
        t.id === selectedTrailId
          ? { ...t, contentCount: t.contentCount + 1 }
          : t
      ));
    }
  };

  return (
    <div className="min-h-screen bg-[#F0F4F8] font-[Inter,sans-serif]">
      <Sidebar activeItem="Trilhas de Conteúdo" />

      <div className="ml-64">
        <Header />

        <main className="p-8">
          <div className="mb-6">
            <h1 className="text-3xl font-bold text-[#0A2540]">Gerenciamento de Conteúdo</h1>
            <p className="text-gray-600 mt-1">Organize trilhas de conhecimento e seus materiais</p>
          </div>

          <div className="grid grid-cols-4 gap-6">
            {/* Trail List - 1 column (25%) */}
            <div className="col-span-1">
              <TrailListPanel
                trails={trails}
                selectedTrailId={selectedTrailId}
                onSelectTrail={setSelectedTrailId}
                onAddTrail={handleAddTrail}
                onEditTrail={handleEditTrail}
                onDeleteTrail={handleDeleteTrail}
              />
            </div>

            {/* Content Panel - 3 columns (75%) */}
            <div className="col-span-3">
              <ContentPanel
                trail={selectedTrail}
                contents={trailContents}
                onAddVideo={handleAddVideo}
                onAddPDF={handleAddPDF}
                onEditContent={handleEditContent}
                onReplaceContent={handleReplaceContent}
                onDeleteContent={handleDeleteContent}
              />
            </div>
          </div>
        </main>
      </div>

      {/* Modals */}
      <AddTrailModal
        isOpen={isTrailModalOpen}
        onClose={() => setIsTrailModalOpen(false)}
        onSave={handleSaveTrail}
        editingTrail={editingTrail}
      />

      <AddContentModal
        isOpen={isContentModalOpen}
        onClose={() => setIsContentModalOpen(false)}
        onSave={handleSaveContent}
        contentType={contentModalType}
        editingContent={editingContent}
      />
    </div>
  );
}

export default TrailManagement;
