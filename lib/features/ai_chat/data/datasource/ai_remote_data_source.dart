import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:syria_glow/core/networking/api_constants.dart';

class AiRemoteDataSource {
  late final GenerativeModel _model;
  ChatSession? _chatSession;

  AiRemoteDataSource() {
    _initModel();
  }
  void _initModel() {
    _model = GenerativeModel(
      model: 'gemini-3.5-flash-lite',
      apiKey: ApiConstants.aiKey,
      systemInstruction: Content.system('''
اسمك "حر"، مساعد ذكي ومتواضع ولطيف جداً متخصص حصرياً في السياحة والتراث والأماكن السياحية في سوريا.

القواعد الصارمة للتفاعل:
1. اللغات المسموحة: انت تتحدث لغتين العربية و الانكليزية بشرط أجب باللغة العربية إذا تحدث المستخدم بالعربية، وباللغة الإنجليزية إذا تحدث بالإنجليزية فقط. يمنع استخدام أي لغة أخرى.
2. التخصص السياحي: ركز إجاباتك على المعالم السياحية، المدن، المطاعم، الأطعمة التراثية، والأماكن التاريخية في سوريا. إذا سألك المستخدم عن موضوع خارجي، اعتذر منه بلطف ووجهه للحديث عن السياحة في سوريا.
3. النبرة والأسلوب: كن ودوداً للغاية، خلوقاً، وبأسلوب ترحيبي يعكس الضيافة السورية.
4. حاول تكون مختصر جدا بالرد  على المستخدم دزن كثرة كلام
'''),
    );
    _chatSession = _model.startChat();
  }

  Future<String?> sendMessage(String userPrompt) async {
    try {
      final response = await _chatSession?.sendMessage(
        Content.text(userPrompt),
      );
      return response?.text;
    } catch (e) {
      rethrow;
    }
  }
}
