from flask import Flask, request, jsonify
from flask_cors import CORS
import feedparser

app = Flask(__name__)
CORS(app)

FONTES = {
    "migalhas": "https://www.receita.fazenda.gov.br",
    "conjur":   "https://www.fazenda.gov.br",
    "jota":     "https://www.senado.leg.br",
    "camara":   "https://www.camara.leg.br",  
    "planalto": "https://www.planalto.gov.br",  
    "cfc":      "https://www.cfc.org.br",
    "fenacon":  "https://www.fenacon.org.br",
    "crcsp":    "https://www.crcsp.org.br",
    "jotainfo": "https://www.jota.info",
    "migalhas_br": "https://migalhas.com.br",
    "valoreconomico": "https://www.valoreconomico.com.br",
    "estadao":  "https://www.estadao.com.br",
    "infomoney": "https://www.infomoney.com.br",
}

# PALAVRAS-CHAVE MOCADAS PARA TESTE
PALAVRAS_CHAVE_MOCADAS = ["tributário", "imposto", "receita federal", "carga tributária"]

@app.get("/fontes")
def listar_fontes():
    print("Listando fontes disponíveis")
    return jsonify({"data": list(FONTES.keys())})

@app.post("/buscar")
def buscar():
    body = request.get_json() or {}
    
    # USA PALAVRAS MOCADAS sem Body
    palavras = PALAVRAS_CHAVE_MOCADAS
    fontes_req = body.get("fontes", list(FONTES.keys()))

    print(f"\n🔍 INICIANDO BUSCA")
    print(f"Palavras mocadas: {palavras}")
    print(f"Fontes selecionadas: {len(fontes_req)} fontes")

    resultados = []

    for fonte in fontes_req:
        if fonte not in FONTES:
            print(f"⚠️ Fonte ignorada (não encontrada): {fonte}")
            continue
            
        url = FONTES[fonte]
        print(f"\n▶ Processando fonte: {fonte} -> {url}")
        
        try:
            feed = feedparser.parse(url)
            print(f"✅Feed obtido: {len(feed.entries)} entries")
            
            for i, entry in enumerate(feed.entries[:5]): #só limita para 5 pra debug
                texto = f"{entry.get('title', '')} {entry.get('summary', '')}".lower()
                

                if i == 0:
                    print(f"Exemplo título: {entry.get('title', '')[:100]}...")
                
                for p in palavras:
                    if p.lower() in texto:
                        print(f"MATCH encontrado para '{p}' no entry {i}")
                        resultados.append({
                            "titulo": entry.get("title", ""),
                            "link":   entry.get("link", ""),
                            "resumo": entry.get("summary", "")[:200],
                            "fonte":  fonte,
                        })
                        break  
                        
        except Exception as e:
            print(f"Erro: {e}")

    print(f"\nTOTAL DE RESULTADOS: {len(resultados)}")
    
    if resultados:
        print("\nPRIMEIROS RESULTADOS:")
        for i, r in enumerate(resultados[:3]):  #só os primeiros 3
            print(f"   {i+1}. {r['titulo'][:80]}...")
            print(f"      Link: {r['link']}")
            print(f"      Fonte: {r['fonte']}")
            print()
    else:
        print("NENHUM resultado encontrado com as palavras mocadas!")

    return jsonify({
        "success": True, 
        "total": len(resultados), 
        "data": resultados,
        "palavras_utilizadas": palavras
    })

if __name__ == "__main__":
    print("🚀Scraper rodando em http://localhost:5000")
    print(f"📝Palavras-chave mocadas: {PALAVRAS_CHAVE_MOCADAS}")
    print("📡 Aguardando requisições POST em /buscar...\n")
    app.run(port=5000, debug=True)