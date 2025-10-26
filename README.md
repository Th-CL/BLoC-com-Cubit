![Mobile-Aplicando BLoC com Cubit](https://github.com/alura-cursos/3033-bloc-com-cubit/assets/22684176/a1b98f40-085b-4a5c-ab7d-757bda996730)

# 🎬 Bilheteria Panucci - Flutter BLoC com Cubit

## Aplicativo completo com filtro por gênero implementado

Este projeto implementa o **Bilheteria Panucci**, um aplicativo de cinema desenvolvido em Flutter usando o padrão BLoC/Cubit para gerenciamento de estado, baseado no curso da Alura.

## ✨ Funcionalidades Implementadas

- 🎭 **Listagem de filmes** com informações detalhadas
- 🎯 **Filtro por gênero** (Todos, Ação, Comédia, Drama, Romance, Documentário, Suspense, Terror, Ficção Científica)
- 🖼️ **Tratamento robusto de imagens** com loading e fallback para erros 404
- 🎨 **Temas dinâmicos** baseados no gênero do filme
- 📱 **Interface responsiva** e moderna
- 🔄 **Estados de loading** e tratamento de erros
- ⚡ **Carregamento local** de dados (sem dependência de rede)

## 🏗️ Arquitetura BLoC/Cubit

### Funcionalidades dos Cubits

#### HomeCubit
- `getMovies()`: Carrega todos os filmes
- `getMoviesByGenre(String genre)`: Filtra filmes por gênero
- Estados: `HomeInitial`, `HomeLoading`, `HomeSuccess`, `HomeError`

#### ThemeCubit
- `changeTheme(String genre)`: Altera tema baseado no gênero do filme

### Estados Implementados
- **HomeLoading**: Exibe indicador de carregamento
- **HomeSuccess**: Lista de filmes carregada
- **HomeError**: Mensagem de erro (ex: "Não existem filmes na categoria escolhida!")

## 🛠️ Tecnologias e Versões

- **Flutter** 3.x
- **Dart** 3.x
- **flutter_bloc** ^8.1.2
- **Java** 17 (Android)
- **Android Gradle Plugin** 8.6.0
- **Kotlin** 2.1.0

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK
- Java 17 instalado
- Android Studio ou VS Code

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/Th-CL/BLoC-com-Cubit.git
cd BLoC-com-Cubit
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o aplicativo:
```bash
flutter run
```

## 📱 Como Usar

1. **Tela Principal**: Visualize todos os filmes em um grid
2. **Filtro por Gênero**: Use o dropdown para filtrar filmes por categoria
3. **Detalhes do Filme**: Toque em um filme para ver detalhes completos
4. **Tratamento de Erro**: Imagens indisponíveis mostram um placeholder

## 🎯 Destaques da Implementação

### ✅ Sistema de Filtros Avançado
```dart
Future<void> getMoviesByGenre(String genre) async {
  emit(HomeLoading());
  try {
    if (genre == 'Todos') {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } else {
      final movies = await homeService.fetchMoviesByGenre(genre);
      if (movies.isEmpty) {
        emit(HomeError('Não existem filmes na categoria escolhida!'));
      } else {
        emit(HomeSuccess(movies));
      }
    }
  } catch(e) {
     emit(HomeError('Não foi possível carregar a lista de filmes!'));
  }
}
```

### ✅ Tratamento Robusto de Imagens
```dart
Image.network(
  movie.imageURI!,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      child: Column(
        children: [
          Icon(Icons.movie, color: Colors.grey),
          Text('Imagem não disponível'),
        ],
      ),
    );
  },
)
```

### ✅ Configuração Moderna do Android
- Java 17 configurado
- Android Gradle Plugin 8.6.0
- Kotlin 2.1.0
- Namespace configurado corretamente

## 📁 Estrutura do Projeto

```
lib/
├── components/
│   ├── home/
│   │   └── genre_filter.dart     # Filtro por gênero
│   ├── movie_screen/             # Componentes de detalhes
│   └── movie_card.dart           # Card de filme
├── logic/cubit/
│   ├── home_cubit.dart           # Gerenciamento da tela principal
│   ├── home_states.dart          # Estados da aplicação
│   └── theme_cubit.dart          # Gerenciamento de temas
├── models/
│   └── movie.dart                # Modelo de dados
├── screens/
│   ├── home.dart                 # Tela principal
│   └── movie_screen.dart         # Tela de detalhes
├── services/
│   └── movies_api.dart           # Serviço de dados
└── movies.json                   # Base de dados local
```

## 🔄 Melhorias Implementadas

- **Carregamento Local**: Dados carregados de arquivo JSON local
- **Tratamento de Erro 404**: Fallback para imagens quebradas
- **Estados Específicos**: Mensagens personalizadas para cada situação
- **Performance**: Uso de `Expanded` e `mainAxisSize.min` para otimizar layout
- **Logs de Debug**: Informações detalhadas para troubleshooting

## � Próximas Melhorias

- [ ] Cache de imagens
- [ ] Pesquisa por nome
- [ ] Favoritos
- [ ] Filtros múltiplos
- [ ] Animações de transição

## 🤝 Baseado no Curso

Este projeto foi desenvolvido como parte do curso **"Flutter: aplicando BLoC com Cubit"** da [Alura](https://alura.com.br), com implementações adicionais e melhorias.

### Tópicos do curso aplicados:
- ✅ Conceitos de gerenciamento de estados
- ✅ Introdução ao BLoC com Cubit
- ✅ Arquivos de estado e Cubit
- ✅ Configuração completa do projeto BLoC
- ✅ Injeção de dependência com BLocProvider
- ✅ BlocBuilder para reatividade da UI

---

⭐ **Se este projeto te ajudou, considere dar uma estrela no repositório!**
