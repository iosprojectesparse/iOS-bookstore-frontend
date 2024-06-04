//provider dart file

import 'package:flutter/material.dart';

class ProviderState extends ChangeNotifier {
  int instructionCount = 0;

  Color selectedStarColor = Colors.yellow;
  Color unselectedStarColor = Colors.grey;
  // AudioPlayer audioPlayer = AudioPlayer();

  List<Color> starColorList = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  String path = "audio/Dartmouth College.m4a";

  //........................................................................
  String flag = "English";
  String heading1 = "Real Vision";
  String instruction = "Instruction";
  String langString = "Language";
  String Disease = "Disease";
  String language = "English";
  String step =
      "We will show you images with black and white patterns. Some of these images have a human face embedded in them. If you find a face, please say “Yes” and click on the face-area. If you do not see a face, please say “No”. ";
  String practice = "Practice";
  List<String> instructionSteps = [
    "When the test starts the please read the given sentence in your normal voice in mic. Later camera will calibrate your eye movements, please track the moving ball until it stops.",
    "After calibration, a set of black and white images will be diplayed. If you see a face, please report (by voice) that you see a face and click on the location of the face. ",
    "If you do not see a face, report ( as no face) and click the next button below",
    "Please perform the test in a low or moderately lit areaa. Avoid bright lit outdoors"
  ];
  List<String> englishSteps = [
    "When the test starts the please read the given sentence in your normal voice in mic. Later camera will calibrate your eye movements, please track the moving ball until it stops.",
    "After calibration, a set of black and white images will be diplayed. If you see a face, please report (by voice) that you see a face and click on the location of the face. ",
    "If you do not see a face, report ( as no face) and click the next button below",
    "Please perform the test in a low or moderately lit areaa. Avoid bright lit outdoors"
  ];

  List<String> japaneseSteps = [
    "テストが始まったら、マイクで通常の声で与えられた文を読んでください。 後でカメラが目の動きを調整します。動くボールが止まるまで追跡してください。",
    "キャリブレーション後、白黒画像のセットが表示されます。 顔が見えたら、顔が見えたことを（音声で）報告し、顔の位置をクリックしてください。 ",
    "顔が表示されない場合は、（顔がないものとして）報告し、下の[次へ]ボタンをクリックしてください。",
    "暗い場所または適度に明るい場所でテストを実行してください。 屋外で明るく照らされることは避けてください。"
  ];
  String startpractice = "Start Practice";
  String starttest = "Start Test";
  String test = "Test";
  String next = "Next";
  String notnow = "Not Now";
  String guide =
      "Please read the given sentence in your normal voice by clicking on the mic option below";
  String voiceresult1 = "Voice Calibration Successful";
  String voiceresult2 = "Try Again";
  String dashboard = "Dashboard";
  String report = "Report";
  String hello = "Hey";
  String volume = "Turn Up The Volume";
  List<String> welcome = ["Welcome to", "Real Vision"];
  String name = "Name";
  String selectedGender = "Male";
  String register = "Register";
  List<String> lGender = ["Male", "Female", "Others"];
  String profile = "Profile";
  String profileDetails = "Profile Details";
  String settings = "Settings";
  String faq = "FAQ's";
  String feedback = "Feedback";
  String about = "About us";
  String skip = "Skip";
  String age = "Age";
  String login = "Login";
  String email = "Email";
  String password = "Password";
  String forgot = "Forgot Password?";
  String donthave = "Don't have account ?";
  String male = "Male";
  String female = "Female";
  String others = "Others";
  String gender = "Gender";
  String ageNo = "18";
  String country = 'Country';
  String selectedCountry = 'India';
  String have = "Already a member?";
  String cont = "Continue";
  String wehelp = "A platform to study illusions of the mind";
  String testinstruction =
      "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
  String policy =
      "By signing up you are agreeing to our Terms and Privacy policy";
  String dousee = "Do you see a face?";
  List<String> instruction1 = [
    "We will show you images with black and white patterns.",
    "Some of these images have a human face embedded in them.",
    " If you find a face, please say “Yes” and click on the face-area.",
    " If you do not see a face, please say 'No'."
  ];
  String calibration = "Calibration";
  String welldone = "Well Done !";
  String welldonedesc =
      "Thank you for completing the test. Please complete your health profile and access your results on the next page.";
  String healthprofile = "Health profile";
  String testquestion2 =
      "Do you have any neurological diagnosed medical condition?";
  String youranswer = "Your Answer";
  String diagnosedyear = "Diagnosed Year";
  String testquestion3 =
      "During the past 7 days, how would you rate your sleep quality overall? ";
  String testquestion1 = "Do you wear eyeglasses?";
  String testquestionanswer1_1 = "For reading.";
  String testquestionanswer1_2 = "For far vision.";
  String testquestionanswer1_3 = "Both";
  String testquestionanswer1_4 = "None";
  String testquestionanswer3_1 = "Excellent";
  String testquestionanswer3_2 = "Good";
  String testquestionanswer3_3 = "Fair";
  String testquestionanswer3_4 = "Poor";
  String testquestionanswer3_5 = "Terrible";
  String testquestion4 =
      "Have you felt depressed or sad much of the time in the past 2 weeks?";
  String testquestionanswer4_1 = "Not at all depressed";
  String testquestionanswer4_2 = "Somewhat depressed";
  String testquestionanswer4_3 = "Moderately depressed";
  String testquestionanswer4_4 = "Very depressed";
  String testquestionanswer4_5 = "Extremely depressed";
  String testquestion5 =
      "Please select how anxious you feel at the moment";
  String testquestionanswer5_1 = "Not at all anxious";
  String testquestionanswer5_2 = "A little anxious";
  String testquestionanswer5_3 = "Moderately anxious";
  String testquestionanswer5_4 = "Very anxious";
  String testquestionanswer5_5 = "Extremely anxious";
  String testquestion6 =
      "Over the past week, have you felt indifferent to doing activities or being with people? Please select one option.";
  String testquestionanswer6_1 = "Normal: No apathy.";
  String testquestionanswer6_2 =
      "Slight: Apathy appreciated by patient and/or caregiver, but no interference with daily activities and social interactions.";
  String testquestionanswer6_3 =
      "Mild: Apathy interferes with isolated activities and social interactions.";
  String testquestionanswer6_4 =
      "Moderate: Apathy interferes with most activities and social interactions.";
  String testquestionanswer6_5 =
      "Severe: Passive and withdrawn, complete loss of initiative.";
  String spec =
      "If you wear reading glasses, please wear them now before starting the test.";
  String selectlanguage = "Select Language";
  List<String> instruction12 = [
    "When the test starts, the microphone and camera will calibrate your voice pattern and eye ball movement for this test.",
    "Please speak the sentence in your microphone in normal voice.",
    "Later track the moving ball continuously with your eyes."
  ];
  List<String> instruction133 = [
    "The test takes 5 to 10 minutes to complete.",
    "Please perform the test in a single sitting without distractions in a low lit, relaxed, peaceful environment.",
    "Avoid brightly lit outdoors and noisy areas since this might affect the accuracy of the tracking."
  ];
  String instruction14makesure = "Make sure that";
  List<String> instruction14 = [
    " Your face is visible",
    "There is good light in your room",
    "There is no strong light behind your back",
    "There are no light reflections on your glasses."
  ];
  String cleanervision = "A platform to study illusions of the mind.";
  String aboutsen1 = "Maya in Sanskrit means ‘illusion’.";
  String aboutsen3 =
      "Real Vision is the first mobile-health app to screen and detect visual misperceptions in the digital era bringing complex neuropsychological metrics directly into the hands of patients.";
  String aboubtsen2 =
      "Through Maya-mind, we study the ‘illusions’ of the mind. ";
  String aboutsen4 = "For more details login to  ";
  String faq1 = "Q. How often can I/should I take the pareidolia test?";
  String answer = "Answer";
  String faq2 = "Q. What if my results are very different each time?";
  String faq3 =
      "Q. What if I had to end the test midway? Can I continue from the same image or have to start again?";
  String faq4 =
      "Q. Where can I find more information about what a pareidolia test is and how to interpret the results?";
  String faq5 =
      "Q. I was distracted during the test, can I erase/delete the test results?";
  String evaluationhistory = "Evaluation History";
  String longitudinalevaluation = "Longitudinal Evaluation";
  List<String> faqans = [
    " Likely and may depend on tracking quality.",
    " However, our visual test has been robustly tested for outlier effects.",
    "In case results are highly unlikely, Maya-mind will re-evaluate and report back with appropriate suggestions for consultation.",
    "Since the test will need to be recalibrated each time, please restart the test from the beginning. ",
    "Please login to www.maya-mind.com for more details and interpretations.",
    " Distractions or looking away from the screen may affect the tracking quality of the test. Please restart a new session and complete the test in a single sitting.",
    "In the event a test session is terminated (phone call, emergency notifications, etc), please restart the test from the beginning.",
    "Please do not delete any test results no matter how small the sessions are."
  ];
  String edit = "Edit";
  String yes = "Yes";
  String hintname = "eg. john wilson";
  String hintage = "eg. 56";
  List<String> forgotpasslist = ["Forget", "Password"];
  String proceed = "Proceed";
  String changepass =
      "Enter the email address associated with your account and we’ll send you a OTP to reset your password";
  String beginpractice = "Begin Practice";
  String skippractice = "Skip Practice";
  String practiceinstruction =
      "If you see a face then say “Yes” and click on the face. If you don’t  see any face then say “ No” and click next";
  String startcalibration = "Start Calibration";
  List<String> diseaselist = [
    "Parkinson’s Disease",
    "Dementia’s with Lewy Body",
    "Alzheimer’s Disease",
    "Schizophrenia",
    "Others",
    "None"
  ];
  String beginevaluation = "Begin evaluation";
  String neurologyconsult = "Neurology consult";
  String voicecalibration = "Voice Calibration";
  String pressmic = "Press the mic button and read aloud the sentence below:";
  String calibrationsentence = "The cat always hide";
  String eyecalibration = "Eye calibration";
  String trackball = "Please track the moving ball carefully";
  String eyesucess = "Eye calibration \n Successful";
  String thanks = "Thank you!";
  String genrating = "Generating result...";
  String pareidoliascore = "Pareidolia Score";
  String good = "Good";
  String trackingquality = "Tracking Quality";
  String visual = "Visual";
  String speech = "Speech";
  String reliability = "Reliability";
  String detailedevaluation = "Detailed Evaluation";
  String risk = "Risk of Neuropsych Complication";

  void translate(String lang) {
    print('lang');
    print(lang);
    if (lang =="🇯🇵 Japanese") {
      flag = "Japanese";
      heading1 = "リアルビジョン";
      instruction = "手順";
      language = lang;
      instructionSteps = japaneseSteps;
      step =
          "黒と白のパターンの画像を表示します。 これらの画像の一部には、人間の顔が埋め込まれています。 顔を見つけたら、「はい」と言って顔の部分をクリックしてください。 顔が見えない場合は「いいえ」と言ってください。";
      practice = "練習 ";
      startpractice = "練習を始める";
      starttest = "テストを開始します";
      notnow = "今はやめろ";
      guide = "下のマイクオプションをクリックして、通常の声で与えられた文を読んでください";
      voiceresult1 = "音声キャリブレーションが成功しました";
      voiceresult2 = '再試行する';
      next = "次";
      test = "テスト";
      dashboard = "ダッシュボード";
      report = "報告する";
      hello = "こんにちは";
      volume = "音量を上げる";
      welcome = ["マヤマインド", "へようこそ"];
      name = "氏名";
      gender = "性別";
      register = "登録";
      profile = "プロフィール";
      profileDetails = "プロファイルの詳細";
      settings = "設定";
      faq = "よくある質問";
      feedback = "フィードバック";
      about = "アプリについて";
      skip = "スキップ";
      age = "年";
      login = "ログイン";
      email = "電子メールアドレス";
      password = "パスワード";
      forgot = "パスワードをお忘れですか？";
      donthave = "アカウントをお持ちではありませんか？";
      country = "国";
      have = "すでにアカウントをお持ちですか？";
      langString = "言語";
      cont = "継続する";
      wehelp = "心の錯覚を研究するためのプラットフォーム";
      testinstruction =
          "顔が表示されたら、マイクをクリックして「はい」と言い、顔をクリックします。顔が表示されない場合は、「いいえ」と言って[次へ]をクリックします";
      dousee = "人間の顔が見えますか？";
      policy = "サインアップすると、利用規約とプライバシーポリシーに同意したことになります";
      calibration = "較正";
      welldone = "素晴らしい ！";
      welldonedesc =
          "テストを完了していただきありがとうございます。 健康プロファイルを完成させ、次のページで結果にアクセスしてください。";
      healthprofile = "健康プロファイル";
      testquestion2 = "神経学的に診断された病状はありますか？";
      youranswer = "あなたの答え";
      diagnosedyear = "診断された年";
      testquestion3 = "過去7日間で、全体的な睡眠の質をどのように評価しますか？";
      testquestionanswer1_1 = "読むために。";
      testquestionanswer1_2 = "遠方視力のために。";
      testquestionanswer1_3 = "両方";
      testquestionanswer1_4 = "なし";
      testquestionanswer3_1 = "優れた";
      testquestionanswer3_2 = "良い";
      testquestionanswer3_3 = "公平";
      testquestionanswer3_4 = "貧しい";
      testquestionanswer3_5 = "ひどい";
      testquestion4 = "過去2週間の多くの時間、落ち込んだり、悲しんだりしましたか？";
      testquestionanswer4_1 = "まったく落ち込んでいない";
      testquestionanswer4_2 = "やや落ち込んでいる";
      testquestionanswer4_3 = "適度に落ち込んでいる";
      testquestionanswer4_4 = "非常に落ち込んでいる";
      testquestionanswer4_5 = "非常に非常に落ち込んでいます";
      testquestion5 = "現時点でどの程度不安を感じているかを選択してください";
      testquestionanswer5_1 = "まったく気になりません";
      testquestionanswer5_2 = "少し気になる";
      testquestionanswer5_3 = "やや不安";
      testquestionanswer5_4 = "とても気になる";
      testquestionanswer5_5 = "非常に心配";
      testquestion6 = "この1週間、活動をしたり、人と一緒にいることに無関心でしたか？ オプションを1つ選択してください。";
      testquestionanswer6_1 = "通常：無関心はありません。";
      testquestionanswer6_2 =
          "わずか：患者や介護者に無関心が認められますが、日常の活動や社会的相互作用に干渉することはありません。";
      testquestionanswer6_3 = "軽度：無関心は孤立した活動や社会的相互作用を妨げます。";
      testquestionanswer6_4 = "中程度：無関心はほとんどの活動や社会的相互作用を妨げます。";
      testquestionanswer6_5 = "重度：受動的で撤回され、主導権が完全に失われます。";
      spec = "老眼鏡をかけている方は、テストを始める前に今すぐ眼鏡をかけてください。";
      selectlanguage = "言語を選択する";
      cleanervision = "心の錯覚を研究するためのプラットフォーム";
      aboutsen1 = "サンスクリット語のマヤは「幻想」を意味します。";
      aboubtsen2 = "マヤマインドを通して、私たちはマインドの「幻想」を研究します。";
      aboutsen3 =
          "マヤマインドは、デジタル時代の視覚的誤解をスクリーニングして検出し、複雑な神経心理学的指標を患者の手に直接届ける最初のモバイルヘルスアプリです";
      aboutsen4 = "詳細については、www.maya-mind.comにログインしてください";
      faq1 = "Q.パレイドリア検査はどのくらいの頻度で受けることができますか？";
      answer = "答え";
      faq2 = "Q.毎回結果が大きく異なる場合はどうなりますか？";
      faq3 =
          "Q.テストを途中で終了しなければならなかった場合はどうなりますか？同じ画像から続行できますか、それとも最初からやり直す必要がありますか？";
      faq4 = "Q.パレイドリア検査とは何か、そして結果をどのように解釈するかについての詳細はどこで見つけることができますか？";
      faq5 = "Q.テスト中に気が散ってしまいましたが、テスト結果を消去/削除できますか？";
      evaluationhistory = "評価履歴";
      longitudinalevaluation = "縦断的評価";
      yes = "はい";
      faqans = [
        "可能性が高く、追跡品質に依存する可能性があります。",
        "しかし、私たちの視覚テストは、外れ値の影響についてしっかりとテストされています。",
        "結果が非常にありそうもない場合、Maya-mindは再評価し、相談のための適切な提案で元に戻ります。",
        "テストは毎回再校正する必要があるため、最初からテストを再開してください。",
        "詳細と解釈につ​​いては、www.maya-mind.comにログインしてください。",
        "気を散らしたり、画面から目をそらしたりすると、テストの追跡品質に影響を与える可能性があります。新しいセッションを再開して、一度にテストを完了してください。",
        "テストセッションが終了した場合（電話、緊急通知など）、最初からテストを再開してください。",
        "セッションがどんなに小さくても、テスト結果を削除しないでください。",
      ];
      edit = "編集";
      hintname = "例えば。 ジョンウィルソン";
      hintage = "例えば。 56";
      instruction1 = [
        "黒と白のパターンの画像を表示します。",
        "これらの画像の一部には、人間の顔が埋め込まれています。",
        "顔を見つけたら、「はい」と言って顔の部分をクリックしてください。",
        ' 顔が見えない場合は「いいえ」と言ってください。'
      ];
      forgotpasslist = ["忘れる", "パスワード"];
      proceed = "続行";
      changepass = "アカウントに関連付けられているメールアドレスを入力すると、パスワードをリセットするためのOTPが送信されます";
      instruction12 = [
        "テストが開始されると、マイクとカメラがこのテストの音声パターンと眼球の動きを調整します。",
        "マイクで普通の声で文章を話してください。",
        "後で、動いているボールを目で連続的に追跡します。"
      ];
      instruction133 = [
        "テストが完了するまでに5〜10分かかります。",
        "暗い場所でリラックスした静かな環境で、気を散らすことなく1人でテストを実行してください。",
        "追跡の精度に影響を与える可能性があるため、明るい屋外や騒がしい場所は避けてください。"
      ];
      beginpractice = "練習を始める";
      skippractice = "練習をスキップ";
      practiceinstruction =
          "顔が表示されたら、「はい」と言って顔をクリックします。 顔が表示されない場合は、「いいえ」と言って[次へ]をクリックします";
      instruction14makesure = "確実に";
      startcalibration = "キャリブレーションを開始します";
      Disease = "疾患";
      beginevaluation = "評価開始";
      longitudinalevaluation = "経時的な評価";
      neurologyconsult = "脳神経内科医へ相談する";
      voicecalibration = "音声キャリブレーション";
      pressmic = "マイクボタンを押して、以下の文章を声に出して読んでください:";
      calibrationsentence = "猫はいつも隠れます";
      eyecalibration = "目のキャリブレーション";
      trackball = "動くボールを注意深く追跡してください";
      eyesucess = "目のキャリブレーション \n が成功しました";
      testquestion1 = "眼鏡をかけていますか？";
      thanks = "ありがとう！";
      genrating = "結果を生成しています...";
      pareidoliascore = "パレイドリアスコア";
      good = "良い";
      trackingquality = "品質の追跡";
      visual = "ビジュアル";
      speech = "スピーチ";
      reliability = "信頼性";
      detailedevaluation = "詳細評価";
      risk = "神経心理学的合併症のリスク";
      diseaselist = [
    "パーキンソン病",
    "レビー小体型認知症",
    "アルツハイマー病",
  "統合失調症",
    "その他",
    "なし"
  ];
      instruction14 = [
    "あなたの顔が見える",
    "あなたの部屋には良い光があります",
    "背中の後ろに強い光はありません",
    "メガネに光の反射はありません."
  ];

    } else if (lang == "Hindi") {
      language = lang;
      flag = "Hindi";
      // volume = "आवाज बढ़ा दो";
      // next = "अगला";
      // welcome = ["मायामाईन्ड में", "आपका स्वागत है।"];
      // name = "नाम";
      // gender = "लिंग";
      // register = "दर्ज करें";
    } else {
      language = lang;
      flag = "English";
      heading1 = "Real Vision";
      instruction = "Instructions";
      instructionSteps = englishSteps;
      beginevaluation = "Begin evaluation";
      neurologyconsult = "Neurology consult";
      voicecalibration = "Voice Calibration";
      pressmic = "Press the mic button and read aloud the sentence below:";
      calibrationsentence = "The cat always hide";
      eyecalibration = "Eye calibration";
      trackball = "Please track the moving ball carefully";
      eyesucess = "Eye calibration Successful";
      thanks = "Thank you!";
      genrating = "Generating result...";
      pareidoliascore = "Pareidolia Score";
      good = "Good";
      trackingquality = "Tracking Quality";
      visual = "Visual";
      speech = "Speech";
      reliability = "Reliability";
      detailedevaluation = "Detailed Evaluation";
      risk = "Risk of Neuropsych Complication";
      diseaselist = [
    "Parkinson’s Disease",
    "Dementia’s with Lewy Body",
    "Alzheimer’s Disease",
    "Schizophrenia",
    "Others",
    "None"
  ];


      startpractice = "Start Practice";
      starttest = "Start Test";
      test = "Test";
      next = "Next";
      notnow = "Not Now";
      guide =
          "Please read the given sentence in your normal voice by clicking on the mic option below";
      voiceresult1 = "Voice Calibration Successful";
      voiceresult2 = "Try Again";
      dashboard = "Dashboard";
      report = "Report";
      hello = "Hey";
      volume = "Turn Up The Volume";
      welcome = ["Welcome to", "Real Vision"];
      name = "Name";
      gender = "Gender";
      register = "Register";
      lGender = ["Male", "Female"];
      profile = "Profile";
      profileDetails = "Profile Details";
      settings = "Settings";
      faq = "FAQ's";
      feedback = "Feedback";
      about = "About us";
      skip = "Skip";
      age = "Age";
      login = "Login";
      email = "Email";
      password = "Password";
      forgot = "Forgot Password?";
      donthave = "Don't have account ?";
      male = "Male";
      female = "Female";
      others = "Others";
      gender = "Gender";
      country = 'Country';
      have = "Already a member?";
      langString = "Language";
      cont = "Continue";
      wehelp = "We help you have a brighter eye sight";
      dousee = "Do you see a face?";
      policy = "By signing up you are agreeing to our Terms and Privacy policy";
      welldone = "Well Done !";
      welldonedesc =
          "Thank you for completing the test. Please complete your health profile and access your results on the next page.";
      healthprofile = "Health profile";
      testquestion2 =
          "Do you have any neurological diagnosed medical condition?";
      youranswer = "Your Answer";
      calibration = "Calibration";
      diagnosedyear = "Diagnosed Year";
      testquestion3 =
          "During the past 7 days, how would you rate your sleep quality overall? ";
      testquestionanswer1_1 = "For reading.";
      testquestion1 = "Do you wear eyeglasses?";
      testquestionanswer1_2 = "For far vision.";
      testquestionanswer1_3 = "Both";
      testquestionanswer1_4 = "None";
      testquestionanswer3_1 = "Excellent";
      testquestionanswer3_2 = "Good";
      testquestionanswer3_3 = "Fair";
      testquestionanswer3_4 = "Poor";
      testquestionanswer3_5 = "Terrible";
      testquestion4 =
          "Have you felt depressed or sad much of the time in the past 2 weeks?";
      testquestionanswer4_1 = "Not at all depressed";
      testquestionanswer4_2 = "Somewhat depressed";
      testquestionanswer4_3 = "Moderately depressed";
      testquestionanswer4_4 = "Very depressed";
      testquestionanswer4_5 = "Extremely depressed";
      testquestion5 =
          "Please select how anxious you feel at the moment";
      testquestionanswer5_1 = "Not at all anxious";
      testquestionanswer5_2 = "A little anxious";
      testquestionanswer5_3 = "Moderately anxious";
      testquestionanswer5_4 = "Very anxious";
      testquestionanswer5_5 = "Extremely anxious";
      testquestion6 =
          "Over the past week, have you felt indifferent to doing activities or being with people? Please select one option.";
      testquestionanswer6_1 = "Normal: No apathy.";
      testquestionanswer6_2 =
          "Slight: Apathy appreciated by patient and/or caregiver, but no interference with daily activities and social interactions.";
      testquestionanswer6_3 =
          "Mild: Apathy interferes with isolated activities and social interactions.";
      testquestionanswer6_4 =
          "Moderate: Apathy interferes with most activities and social interactions.";
      testquestionanswer6_5 =
          "Severe: Passive and withdrawn, complete loss of initiative.";
      spec =
          "If you wear reading glasses, please wear them now before starting the test.";
      selectlanguage = "Select Language";
      cleanervision = "A platform to study illusions of the mind.";
      aboutsen1 = "Maya in Sanskrit means ‘illusion’.";
      aboubtsen2 = "Through Maya-mind, we study the ‘illusions’ of the mind. ";
      aboutsen3 =
          "Real Vision is the first mobile-health app to screen and detect visual misperceptions in the digital era bringing complex neuropsychological metrics directly into the hands of patients.";
      aboutsen4 = "For more details login to  ";
      faq1 = "Q. How often can I/should I take the pareidolia test?";
      answer = "Answer";
      faq2 = "Q. What if my results are very different each time?";
      faq3 =
          "Q. What if I had to end the test midway? Can I continue from the same image or have to start again?";
      faq4 =
          "Q. Where can I find more information about what a pareidolia test is and how to interpret the results?";
      faq5 =
          "Q. I was distracted during the test, can I erase/delete the test results?";
      evaluationhistory = "Evaluation History";
      longitudinalevaluation = "Longitudinal Evaluation";
      yes = "Yes";
      faqans = [
        " Likely and may depend on tracking quality.",
        " However, our visual test has been robustly tested for outlier effects.",
        "In case results are highly unlikely, Maya-mind will re-evaluate and revert back with appropriate suggestions for consultation.",
        "Since the test will need to be recalibrated each time, please restart the test from the beginning. ",
        "Please login to www.maya-mind.com for more details and interpretations.",
        " Distractions or looking away from the screen may affect the tracking quality of the test. Please restart a new session and complete the test in a single sitting.",
        "In the event a test session is terminated (phone call, emergency notifications, etc), please restart the test from the beginning.",
        "Please do not delete any test results no matter how small the sessions are."
      ];
      hintname = "eg. john wilson";
      edit = "Edit";
      hintage = "eg. 56";
      instruction1 = [
        "We will show you images with black and white patterns.",
        "Some of these images have a human face embedded in them.",
        " If you find a face, please say “Yes” and click on the face-area.",
        ' If you do not see a face, please say “No”.'
      ];
      forgotpasslist = ["Forget", "Password"];
      proceed = "Proceed";

      changepass =
          "Enter the email address associated with your account and we’ll send you a OTP to reset your password";
      instruction12 = [
        "When the test starts, the microphone and camera will calibrate your voice pattern and eye ball movement for this test.",
        "Please speak the sentence in your microphone in normal voice.",
        "Later track the moving ball continuously with your eyes."
      ];
      instruction133 = [
        "The test takes 5 to 10 minutes to complete.",
        "Please perform the test in a single sitting without distractions in a low lit, relaxed, peaceful environment.",
        "Avoid brightly lit outdoors and noisy areas since this might affect the accuracy of the tracking."
      ];
      beginpractice = "Begin Practice";
      skippractice = "Skip Practice";
      practiceinstruction =
          "If you see a face then say “Yes” and click on the face. If you don’t  see any face then say “ No” and click next";
      instruction14makesure = "Make sure that";
      startcalibration = "Start Calibration";
      Disease = "Disease";
    }
    notifyListeners();
  }

  void Fgender(String gen) {
    selectedGender = gen;
    notifyListeners();
  }

  void Fcountry(String cntry) {
    selectedCountry = cntry;
    notifyListeners();
  }

  // dynamic setUser(String user, String pass, String phone, String gender,
  //     String email, String age) {
  //   uName = user;
  //   uEmail = email;
  //   uGender = gender;
  //   uPass = pass;
  //   uPhone = phone;
  //   uAge = age;
  //   notifyListeners();
  // }

  // Future<String> RegisterUser(String user, String pass, String phone,
  //     String gender, String email, String age) {
  //   uName = user;
  //   uEmail = email;
  //   uGender = gender;
  //   uPass = pass;
  //   uPhone = phone;
  //   uAge = age;
  //   notifyListeners();
  //   return Networking().Register();
  // }

  // dynamic LoginUser(String user, String pass) {
  //   uName = user;
  //   uPass = pass;
  //   notifyListeners();
  // }

  void StarColor(int val) {
    for (int i = 0; i < val; i++) {
      starColorList[i] = Colors.yellow;
    }
    for (int i = val; i < 5; i++) {
      starColorList[i] = Colors.grey;
    }
    notifyListeners();
  }

  // void playLocal() async {
  //   int result = await audioPlayer.play(path, isLocal: true);
  // }
}
