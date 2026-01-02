#import "./template.typ": *
#show: master_thesis.with(
  title: "岩見沢市母子健康調査 (SMILE Iwamizawa) における母乳と乳幼児糞便の統合NMRメタボロミクス",
  author: "阿部 潤",
  university: "北海道大学",
  school: "生命科学院",
  department: "ソフトマター専攻",
  term: "2025年度",
  lab: "蛋白質科学研究室",
  class: "修士",
)

// = 概要
// この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。  

// この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。

// この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。

この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。


= 諸言
*乳児の成長・便・腸内細菌について*
- DOHaD仮説というものが存在する
  - 乳児期に置かれた環境が成人後の生活習慣病リスクに影響を与える
  - 腸内細菌叢も環境の一部で、成長・発達に影響を与える
- 腸内細菌の形成過程
  - 分娩前
    - 胎盤・用水・胎便から非病原性DNAの検出例がある（議論あり）
  - 分娩時
    - 経腟分娩か帝王切開かで大きく異なる
  - 栄養状態
    - 母乳育児か人工乳育児かで大きく異なる
    - 抗菌薬投与
  - 生活環境における微生物曝露
    - ペットの有無、兄弟姉妹の有無
  - 成長に伴う変化
    - 出生後数週間は残存酸素が存在するので、好気性菌が優勢
    - その後嫌気環境になり、ビフィズス菌が優勢
    - 離乳すると植物性多糖類や動物性タンパク質を分解できる成人様の菌群（Bacteroidetes門、Firmicutes門）が急速に増加する。
    - 3歳頃までに成人型の腸内細菌叢に近づく。その後は比較的安定。食習慣や抗菌薬投与などで変化することも。
- 腸内細菌を調べるときに、糞便サンプルの*メタゲノミクス解析*だけでは不十分である→メタボロミクス解析も必要
  - メタゲノミクスではその設計図を得ることしかできず、最終出力には繋がらない
  - 活性や発現量が考慮されておらず、死菌のDNAも含まれる
  - 同一人物由来のサンプルでも、メタゲノムはメタボロームより変動が大きい
  - 機能的冗長性により、ある特定の菌株が増減しても、他の菌株がその機能を補完し、最終出力には影響を与えない場合がある
    - 炎症性腸疾患（IBD）等の疾患状態における研究では、ショットガン・メタゲノミクスによって特定の分類群の増減が確認されたとしても、それに基づいて計算された代謝経路の機能的ポテンシャルには有意な差が見られないケースが報告されている。
  - 食事・薬剤などの外的要因に対する応答がより反映される

*母乳について*
- 母乳育児は大事である
  - 疫学的に影響を与えているデータが欲しい
- 母乳中には色々な成分がある
  - 脂質、蛋白質、炭水化物、抗体、ビタミン、ミネラル
  - 代謝物も大事
- マクロ栄養素についてはよく調べられている
  - 時系列変化が存在する
- 母乳は乳児が摂取する唯一の栄養→腸内細菌のえさとして重要
#v(1em)
つまり、*乳児期の腸内環境の形成過程を理解するためには、母乳および母子の糞便の代謝物プロファイルを同時に明らかにすることが重要である。*

ヒトにおけるメカニズムについては、コホートの希少性や測定に要するリソースの制約から、依然として解明が進んでいない。本研究では、授乳期における母乳および乳児の糞便代謝物の変動、ならびにそれらの相関関係を明らかにすることを目的とし、北海道岩見沢市で実施中の前向きコホート研究である岩見沢市母子健康調査（SMILE Iwamizawa）に参加している母親とその乳児を対象に、母乳および母子糞便のNMRメタボローム解析を実施した。

// NMRでやったことを強調してもいいと思うけど、一旦後回し

= 材料と方法
== 実験デザイン
本研究は、北海道岩見沢市で実施中の前向きコホート研究である、岩見沢市母子健康調査（SMILE Iwamizawa）@komatsuAssociationsMaternalDiet2023 の一環として実施された。
本調査は、健康な妊婦を対象に、妊娠中の環境の把握から始め、出産、乳児期から幼児期、学童期まで子供の生活習慣、健康状態を調査することで、子供の成長発達に影響を与える因子や、近年増加している子どものアレルギーや肥満などの様々な疾患の原因を明らかにすることを目的としている。

本研究はヘルシンキ宣言の精神に則り実施された。
ヒトを対象とする全ての実施手順は、北海道大学大学院医学研究院医の倫理委員会（承認番号：16-039）および森永乳業倫理委員会（承認番号：16005-144）の承認を得ている。
岩見沢市在住の妊婦が母子健康手帳の交付を受ける際に、本調査に関する説明を行い、書面によるインフォームド・コンセントを得た。
なお、乳児の研究参加については、代諾者である母親の同意をもってこれに代えた。
同意を得られた参加者（母、子）に対して、調査票などによる調査や母乳・糞便の採取を実施した。
採取された試料は速やかに −20$degree$C で保管され、採取から約1ヶ月以内に分析時まで −80$degree$C で凍結保存された。参加者の臨床的特性については、@tbl-basicInfo に示す通りである。
また、サンプルの採取時期およびサンプル数については、@tbl-sampleInfo に示す通りである。

== サンプル調製
=== 母乳<sec4.2.1>
解凍した母乳試料 1 mL を、15,000 rpm、4$degree$C で30分間遠心分離し、脂質層と水層を分離させた。回収した水層画分 400 μL を、分子量 5 kDa 以上の高分子除去用遠心式限外ろ過フィルターユニット（UFC3LCCNB-HMT; Human Metabolome Technologies, Tsuruoka, Japan）に充填し、9,100 $times$g、4$degree$C で完全にろ過されるまで遠心を行った。なお、フィルターユニットの洗浄のため、事前に超純水 300 μL を用いた遠心（9,100 $times$g、4$degree$C、30分間）を3回繰り返した。 得られたろ液 270 μL に対し、超純水 270 μL および NMR 測定用緩衝液 60 μL（pH 7.4, 50 mM Sodium phosphate, 0.5 mM 3-(trimethylsilyl)propionic acid-d4 sodium salt (TSP), 0.04% NaN#sub[3], 1 mM formate, 10% D#sub[2]O；濃度はすべて終濃度）を添加した。この混合液 600 μL のうち 540 μL を外径 5 mm の NMR 試料管（SJ-5; Shigemi, Hachioji, Japan）に充填した。その後、試料中の溶存酸素を除去するため、試料管を超音波洗浄機に数秒間供し、脱気を行った。

=== 母子糞便
凍結保存された糞便試料を 4$degree$C で解凍し、スパーテルを用いて2分間均一に撹拌した後、約 200 mg を分注した。
秤量した試料重量に対して10倍量の NMR 測定用緩衝液（組成は #ref(<sec4.2.1>)と同一）を添加し、1,800 rpm、4$degree$C で15分間振とう抽出を行った。
抽出後、13,000 rpm、4$degree$C で5分間遠心分離し、上清約 1.5 mL を回収して -80$degree$C で保存した。
測定直前に 4$degree$C で再解凍し、15,000 rpm、4$degree$C で10分間遠心分離した後の上清 540 μL を、外径 5 mm の NMR 試料管（SJ-5; Shigemi, Hachioji, Japan）に充填した。

== NMR測定 <sec4.3>
NMR スペクトルの測定には、CryoProbe#super[TM] および SampleJet を装着した Bruker Avance Neo 800 MHz 分光計を用い、すべての測定を 25$degree$Cで実施した。
パルスシーケンスにはプレサチュレーション付き1次元 #super[1]H NOESY（noesypr1d）を用いた。
主な測定パラメータは、観測範囲 12 ppm, データポイント数 65536、ダミースキャン回数 8回、積算回数 128回、取り込み時間 3.4秒、待ち時間 1.6秒、NOE混合時間 0.1秒とした。

== スペクトル処理・濃度定量
スペクトルデータの処理および濃度定量には、Chenomx NMR Suite 12.0（Chenomx Inc., Edmonton, Canada）を用いた。
Chenomx Processor により、0.3 Hz のラインブロードニングを適用した指数関数をウィンドウ関数として乗じ、データポイント数が 262,144 となるようにゼロフィリングを行った後、フーリエ変換を実施した。
位相およびベースラインを手動で補正し、全スペクトルを TSP の信号強度に基づいて規格化した。

=== 母乳
Chenomx Profiler を用い、内蔵データベースを基に代謝物の同定と濃度定量を行った。
データベースに未登録の代謝物については、標準物質を同一条件で測定（@sec4.3 参照）したスペクトルをリファレンスとして同定・定量を実施した。

また、濃度定量の解析者による系統誤差を最小限に抑えるため、本作業の解析手順を統一し、文書化した。
解析手順の統一性を評価するため、異なる5人の解析者が同一試料セット（n=4）を解析し、その定量値について、主成分分析（PCA）および、Bland-Altman分析を実施した。


=== 母子糞便
Chenomx Profiler を用いてスペクトルのビニングを行い、各ビン領域の信号強度総和を算出した。
ビンの幅は 0.02 ppm とし、化学シフト範囲は 0 ppm から 10 ppm までとした。ただし、水信号領域（4.68 ppm ～ 4.88 ppm）は解析から除外した。

== 統計解析
母乳の濃度データおよび母子糞便のビニングデータを用い、多変量解析ソフト SIMCA 18（Sartorius, Umeå, Sweden）にて多変量解析を実施した。
各変数は平均 0、分散 1 となるように標準化（Unit variance scaling）を行い、PCAおよび直交部分的最小二乗回帰分析（OPLS-DA/R）を実施した。
群間の統計学的比較には、Welch の t検定または Tukey-Kramer 法を用いた。

= 結果
== 母乳の#super[1]H-NMR測定及び代謝物同定・定量<sec5.1>
全てのサンプルについて、良好な#super[1]H-NMRスペクトルを得た（@fig-bmSpec）。代謝物の同定はピークの組み合わせによって決定され、
// 糖類が8種類、アミノ酸及び関連代謝物が21種類、エネルギー関連代謝物が11種類、有機酸とその他化合物が11種類、
計51種類の代謝物を同定・定量した。これらすべての代謝物の平均濃度は@fig-bmConc に示すとおりである。

== 母乳中代謝物の定量における解析者間の系統誤差の評価
@sec5.1 の解析において、解析者間による定量値の系統誤差の低減を目的に、本作業の解析手順を統一し、その評価を実施した（@fig-bmManual）。PCAスコアプロット（@fig-bmManual A）において、5人の解析者が同一試料セット（n=4）を解析した結果が重なり合って分布しており、解析者間で大きな差異がないことが示された。Bland-Altman分析（@fig-bmManual B）においても、各代謝物について5人の解析者が得た定量値の平均値と、各解析者の定量値と平均値との差をプロットした結果、ほとんどの代謝物が平均差の95%信頼区間内に収まっており、解析者間で大きな系統誤差がないことが確認された。以降、本研究における母乳中代謝物の濃度定量は、この統一された手順に基づいて実施した結果を用いることとした。

== 産後時期別の母乳中メタボローム解析<sec5.3>
母乳中メタボロームを可視化するため、濃度定量値をもとにPCAを実施した（@fig-bmPCA）。スコアプロットを母乳の採取時期別に色分けした結果、初乳・産後1ヶ月・産後4-5ヶ月の各群でクラスターの形成が確認できた。これらのクラスターは第1主成分・第2主成分が初乳とその他の群の分離に寄与しており、ローディングプロットにおいて、2'-fucosyllactose (2'-FL）、3'-sialyllactose、6'-sialyllactoseなどのヒトミルクオリゴ糖（HMOs）やmyo-Inositolが初乳群の特徴的な代謝物であった。
一方産後1ヶ月・産後4-5ヶ月群では、Lactoseなどエネルギーの供給源となる代謝物や、Caprate、Caprylateなどの中鎖脂肪酸が特徴的であった。
また、産後1ヶ月群と産後4-5ヶ月群の分離には、第3主成分が寄与しており、HMOsの一種である3-fucosyllactose（3-FL）やLactate・Pyruvateなどの短鎖脂肪酸が産後1ヶ月群で、CitrateやO-phosphocholineが産後4-5ヶ月に特徴的な代謝物であった。
// 考察ポイント
// ヒトミルクオリゴ糖の説明
// 短鎖脂肪酸・中鎖脂肪酸の機能
// 3'-SLの明確な減少はこのコホートの特徴な気がする（他の研究ではそこまで顕著ではない？）

定量された各代謝物濃度の産後時期別の単変量解析を行った（@fig-bmSugar - @fig-bmOther）。
@fig-bmSugar では、2'-FLの濃度分布が二峰性を示した。
2'-FLは代表的なHMOsの一つで、LactoseにFucoseがα1,2結合したオリゴ糖であり、その合成には_FUT2_遺伝子にコードされるα1,2-フコシルトランスフェラーゼ（FUT2）が関与している。
FUT2の活性には遺伝的多型が影響を与え、分泌型（Se+）の個体は2'-FLを豊富に分泌し、HMOs全体の約30%を占める @vanniekerkHumanMilkOligosaccharides2014 。一方、非分泌型（Se-）の個体は2'-FLをほとんど分泌しないことが知られている。// 引用文献を追加。
// 本研究でも反映が確認された

以降の解析では、2'-FL濃度が 0.1 mM を閾値として、Se+群（2'-FL濃度 > 0.1 mM）とSe-群（2'-FL濃度 ≤ 0.1 mM）に分類し、各群の母乳中代謝物プロファイルの比較を実施している。
このとき、分泌型の個体は全体の81%を占めていた（Se+: 110, Se-: 26）。これは、日本人集団におけるFUT2分泌型の頻度が約80%であることと一致していた @kodaMolecularBasisSecretor1996 。

== 分泌型/非分泌型における母乳中メタボロームの差異解析
@sec5.3 のPCA及び単変量解析の結果を踏まえ、2'-FLに注目した詳細な解析を実施するため、2'-FL分泌型/非分泌型を目的変数としたOPLS-DAを実施した（ @fig-bmOPLSDA ）。
分離の良いモデルを構築することができ（@fig-bmOPLSDA A）、ローディングプロット及びVIP値（@fig-bmOPLSDA B）から、FucoseがSe+群で特徴的な代謝物であり、3-FLがSe-群で特徴的な代謝物であることが示された。それ以外の代謝物については、Se+群とSe-群の間で特徴的な差異は認められなかった。

2'-FL分泌型/非分泌型による母乳中2'-FL、3-FL、Fucose濃度の比較を、産後時期別に単変量解析を実施した（@fig-bmSecConc）。
その結果からも、2'-FL、FucoseはSe+群で、3-FLはSe-群で有意に高く、その差異も2倍以上であることが確認された。

// 考察ポイント
// Secはフコース糖関連代謝以外には影響を与えない
// 2'-FLと3-FLの競合的合成が起きている可能性を指摘
// 現に餌の機能は同じ
// Fucoseは全体的なFucose糖が減少しているので、Se-ではそもそもの合成量がフィードバックにより制限されている？（この辺はトランスクリプトームなどで詳細解析したほうがいい）

== 糞便の#super[1]H-NMR測定及び代謝物同定
全てのサンプルについて、良好な#super[1]H-NMRスペクトルを得た（@fig-feSpec）。代謝物の同定はピークの組み合わせによって決定され、最大76種類の代謝物を同定した。

== 母子糞便中メタボロームの主成分分析
母子ともに、産後時期別に糞便中メタボロームを可視化するため、糞便測定スペクトルから作成したビニングデータをもとにPCAを実施した（@fig-fePCA）。
母乳同様に、スコアプロットを産後時期別に色分けした結果、乳児ではクラスターの形成が確認でき、出産直後と産後1ヶ月の群、及び産後1.5年以降の群は重なり合って分布していた。
これらは第1主成分が分離に寄与していた。
一方、母親では産後時期によるクラスターの形成は確認できなかった。
また、母子ともに2'-FL分泌型/非分泌型による明確な分離は認められなかった。

== 母子糞便中メタボロームの産後時期によるOPLS-R解析
母子ともに、産後の糞便中メタボロームの経時変化を詳細に解析するため、サンプル採取時期を目的変数としてOPLS-Rを実施した（@fig-feOPLSR）。
乳児糞便では@fig-feOPLSR A に示すように、良好なモデルを構築することができ、S-Lineプロット（@fig-feOPLSR B）から、Glucose、Lactose、Galactoseなどの糖類やmyo-Inositolが出産後初期に特徴的な代謝物であることが示された。
母親の糞便中メタボロームについても、良好なモデルを構築することができ（@fig-feOPLSR C）、S-Lineプロット（@fig-feOPLSR D）から、Aspartateが出産後後期に特徴的な代謝物であることが示された。
// aspartate: 2.83ppm
// L-dopa (6.79 ppm)が出産後後期に特徴的かもしれない。周辺ビンは特徴的としてカウントされている。
// 
// 考察ポイント
// 乳児糞便での糖類が初期で出てくるのは、母乳の糖類が未消化で出てくるから？
// myo-Inositolは母乳中に多く出てくるからそれが反映されている？でもなんで町内に残っているかは不明すぎる

== 分泌型/非分泌型における母子糞便中メタボロームの差異解析
母子ともに、2'-FL分泌型/非分泌型を目的変数としたOPLS-DAを実施した（@fig-feOPLSDA）。
乳児では、授乳時期別に出産直後、生後1ヶ月、生後4-5ヶ月では良好なモデルを構築することができた（@fig-feOPLSDA A、C、E）。
S-Lineプロットから、出産直後（@fig-feOPLSDA B）では2'-FLとLactuloseが分泌型で、3-FLとInosineが非分泌型で特徴的であることが示された。
生後1ヶ月（@fig-feOPLSDA D）では2'-FLとLactuloseが分泌型で特徴的であること、生後4ヶ月ではInosineが非分泌型で特徴的であることが示された。
一方、生後8ヶ月以降では明確な分離は認められなかった。
また、母親ではいずれの時期においても明確な分離は認められなかった。
// 考察ポイント
// 2'-FLと3-FLは母乳メタボライトを反映しているんだと思う
// LactuloseがSe+で高いのは腸内で使い切れないから？
// InosineはSe-で高いのはなぜ？母乳中にはほとんど含まれていない。

= 考察
この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。

この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。

= 結論
この文書は、著作権の対象となっている文章を、ウィキペディア日本語版において引用する際に守るべき事項を定めたものです。なお、この文書において「引用」とは、参考文献に掲載されている文章等を抜粋し、転載すること (Quotation) をいい、執筆者独自の文章に対し、その文章の作成において参照された文献の書誌情報のみを表示すること (Citation) を指すものではありません。後者に関する詳しい説明は、Wikipedia:出典を明記するを参照してください。

= 参考文献
#text(lang: "en")[
  #bibliography("references.bib", title: none, style: "nature")
]

= 図表
#let table_subjectFeature = csv("./tables/subjectFeature.csv")
#tbl(
  [
    #table(
      columns: 2,
      // ..table_subjectFeature.flatten(),

      [母親の特徴量],[値 (n=121)],
      [年齢 (歳)#super[\*1]],[31.4 ± 4.7],
      [身長 (cm)#super[\*1]],[158.9 ± 5.5],
      [妊娠初期の体重 (kg)#super[\*1]],[55.0 ± 10.1],
      [妊娠初期のBMI#super[\*2] (kg/m2)#super[\*1]],[21.6 ± 3.3],
      [妊娠中の体重増加量#super[\*3] (kg)#super[\*1]],[9.7 ± 4.1],
      [妊娠期間 (週)#super[\*1]],[39.0 ± 1.2],
      [妊娠回数 [n (%)]],[2.21 ± 1.4],
      [初産婦 [n (%)]],[25 (20.7)],
      [帝王切開 [n (%)]],[16 (13.2)],
    )
    #table(
      columns: 2,

      [新生児の特徴量],[値 (n=119)],
      [性別（男の子） [n (%)]],[66 (55.4)],
      [出生体重#super[\*1] (g)],[3149.6 ± 412.8],
      [出生身長#super[\*1] (cm)],[49.0 ± 2.1],
      //計算が面倒なので、後で追加 
      // [SGA#super[\*4] [n (%)]],[6 (8.5)],
      // [LGA#super[\*5] [n (%)]],[5 (7.0)],
      [低出生体重児分娩#super[\*4] [n (%)]],[6 (5.04)],
      [早産分娩#super[\*5] [n (%)]],[1 (0.84)]
    )
  ],
  caption: "研究参加者の母子特性",
)<tbl-basicInfo>
#set par(first-line-indent: 0em)
  \*1 平均値 ± 標準偏差。

  \*2 body mass index、初回臨床受診時に得られた情報に基づき算出。

  \*3 初回臨床受診時と分娩直前の体重の差。

  // \*4 small for gestational age、在胎週数に応じた出生体重が10パーセンタイル未満である新生児。

  // \*5 large for gestational age、在胎週数に応じた出生体重が90パーセンタイル以上である新生児。

  \*4 2500 g 未満。

  \*5 37週未満。

#pagebreak()
#tbl(
  table(
    columns: 4,

    [採取時期],[母乳],[母親糞便],[乳児糞便],
    [出産前24週],[-],[113],[-],
    [出産直後],[136],[122],[106],
    [生後1ヶ月],[136],[102],[78],
    [生後4-5ヶ月],[98],[106],[85],
    [生後8ヶ月],[-],[-],[106],
    [生後1年半],[-],[-],[88],
    [生後3年],[-],[-],[50],
    [生後5年],[-],[-],[15],
  ),
  caption: [
    サンプル採取時期とサンプル数
  ],
)<tbl-sampleInfo>
\- はサンプル未採取を示す。

#pagebreak()
#set par(first-line-indent: 1em)


#img(
  [
    #image("Figures/10016010mMd_BM00541_1.svg", height: 23%)
    #image("Figures/10016010mMd_BM00541_2.svg", height: 23%)
    #image("Figures/10016010mMd_BM00541_3.svg", height: 23%)
  ],
  caption: [
    母乳のNMRスペクトル。図中の番号は同定された代謝物を示す。

    1, Caprate; 2, Caprylate; 3, Butyrate; 4, Isoleucine; 5, Leucine; 6, 2-Aminobutyrate; 7, Valine; 8, 3-fucosyllactose; 9, 2'-fucosyllactose; 10, fucose; 11, Threonine; 12, Lactate; 13, alanine; 14, 6'-sialyllactose; 15, 3'-sialyllactose; 16, acetate; 17, proline; 18, Glutamate; 19, acetate; 20, pyruvate; 21, succinate; 22, glutamine; 23, citrate; 24, aspartate; 25, asparagine; 26, 2-oxoglutarate; 27, lysine; 28, creatine; 29, Creatine phosphate; 30, Creatinine; 31, cis-aconitate;, 32, ethanolamine; 33; choline; 34, O-phosphocholine; 35, sn-Glycero-3-phosphocholine; 36, glucose, 37, betaine; 38, lactose; 39, methanol; 40, taurine; 41, fucose;, 42, glycine; 43, myo-Inositol; 44, Urea; 45, fumarate; 46, tyrosine;, 47, histidine; 48, tryptophan; 49, phenylalanine, 50, uridine; 51, formate.
  ]
)<fig-bmSpec>


#img(
  image(
    "Figures/mean_concentration_barplot.png",
  ), 
  caption: [同定できた化合物の平均濃度。エラーバーは標準偏差を示す。]
)<fig-bmConc>

#pagebreak()
#img(
  table(
    columns: 1,
    fill: none,
    stroke: none,
    inset: 5pt,

    [A],
    image(
      "Figures/bmPCAmanual_Score.svg", 
      width: 85%
    ),
    [B],
    image(
      "Figures/bmPCAmanual_blandaltman.svg", 
      width: 85%
    )
  ),
  caption: [母乳中代謝物の濃度定量における解析者間の系統誤差の評価
  
  A: 主成分分析（PCA）スコアプロット。5人の解析者が同一試料セット（n=4）を解析した結果を示す。B: Bland-Altman分析。各代謝物について、5人の解析者が得た濃度定量値の平均値と、各解析者の定量値と平均値との差をプロットした。橙線は平均差の95%信頼区間を、緑線は2つの測定方法の誤差の許容範囲（limits of agreement; LOA）を示し、「差の平均値±1.96×差の標準偏差」で表される。
  ]
)<fig-bmManual>
// 縦並びにレイアウトを修正する。

#img(
  image(
    "/Figures/bmPCA_timeCourse.svg",
    width: 100%,
  ),
  caption: [
    母乳中代謝物のPCA結果。
    
    左：スコアプロット。右：ローディングプロット。
]
)<fig-bmPCA>

#img(
  table(
    columns: 4,
    fill: none,
    stroke: none,
    inset: 5pt,

    image("Figures/bmUnivariate/timing_with_stats_2'-fucosyllactose.png",),
    image("Figures/bmUnivariate/timing_with_stats_3'-sialyllactose.png",),
    image("Figures/bmUnivariate/timing_with_stats_3-fucosyllactose.png",),
    image("Figures/bmUnivariate/timing_with_stats_6'-sialyllactose.png",),
    image("Figures/bmUnivariate/timing_with_stats_Fucose.png",),
    image("Figures/bmUnivariate/timing_with_stats_Galactose.png",),
    image("Figures/bmUnivariate/timing_with_stats_Glucose.png",),
    image("Figures/bmUnivariate/timing_with_stats_Lactose.png",),
  ),
  caption: [
    糖類の経時変化による母乳中代謝物濃度の比較。
  ]
)<fig-bmSugar>

#img(
  table(
    columns: 5,
    fill: none,
    stroke: none,
    inset: 5pt,

    image("Figures/bmUnivariate/timing_with_stats_2-Aminobutyrate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Alanine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Asparagine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Aspartate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Betaine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Glutamate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Glutamine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Glycine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Histidine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Isoleucine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Leucine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Lysine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Methionine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Phenylalanine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Proline.png",),
    image("Figures/bmUnivariate/timing_with_stats_Taurine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Threonine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Tryptophan.png",),
    image("Figures/bmUnivariate/timing_with_stats_Tyrosine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Urea.png",),
    image("Figures/bmUnivariate/timing_with_stats_Valine.png",),  
  ),
  caption: [
    アミノ酸及びその関連代謝物の経時変化による母乳中代謝物濃度の比較。
  ]
)<fig-bmAmino>

#img(
  table(
    columns: 4,
    fill: none,
    stroke: none,
    inset: 5pt,

    image("Figures/bmUnivariate/timing_with_stats_2-Oxoglutarate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Acetone.png",),
    image("Figures/bmUnivariate/timing_with_stats_cis-Aconitate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Citrate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Creatine phosphate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Creatine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Creatinine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Fumarate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Lactate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Pyruvate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Succinate.png",),
 
  ),
  caption: [
    エネルギー関連代謝物の経時変化による母乳中代謝物濃度の比較。
  ]
)<fig-bmEnergy>

#img(
  table(
    columns: 4,
    fill: none,
    stroke: none,
    inset: 5pt,

    image("Figures/bmUnivariate/timing_with_stats_Acetate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Butyrate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Caprate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Caprylate.png",),
    image("Figures/bmUnivariate/timing_with_stats_Choline.png",),
    image("Figures/bmUnivariate/timing_with_stats_Ethanolamine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Methanol.png",),
    image("Figures/bmUnivariate/timing_with_stats_myo-Inositol.png",),
    image("Figures/bmUnivariate/timing_with_stats_O-Phosphocholine.png",),
    image("Figures/bmUnivariate/timing_with_stats_sn-Glycero-3-phosphocholine.png",),
    image("Figures/bmUnivariate/timing_with_stats_Uridine.png",),
    

  ),
  caption: [
    脂肪酸及びその他代謝物の経時変化による母乳中代謝物濃度の比較。
  ]
)<fig-bmOther>

#img(
  table(
    columns: 2,
    fill: none,
    stroke: none,
    inset: 5pt,

    [A],[B],
    image("Figures/bmOPLSDA_secScore.svg",),
    image("Figures/bmOPLSDA_secLoading.svg",),

  ),
  caption: [
    母乳中代謝物の2'-FL分泌型によるOPLS-DA結果。
    
    A: スコアプロット。Se+（青色）は2'-FL分泌型個体、Se-（橙色）は2'-FL非分泌型個体を示す。B: ローディングプロット。図中点の色は、VIPの値により色分けされている。（R2Y: 0.678, Q2: 0.606）
  ]
)<fig-bmOPLSDA>

#pagebreak()
#img(
  table(
    columns: 4,
    fill: none,
    stroke: none,
    inset: 5pt,

    image("Figures/bmUnivariate/sec_with_stats_2'-fucosyllactose.png",),
    image("Figures/bmUnivariate/sec_with_stats_3-fucosyllactose.png",),
    image("Figures/bmUnivariate/sec_with_stats_Fucose.png",),
  ),
  caption: [
    2'-FL分泌型個体・非分泌型個体間で、優位な濃度差が見られた代謝物。
    
    青色はSe+（2'-FL分泌型個体）、橙色はSe-（2'-FL非分泌型個体）を示す。
  ]
)<fig-bmSecConc>
// =0.000はおかしいので直す

#pagebreak()
#img(
  image(
    "Figures/cSx.svg",
  ),
  caption: [
  母子糞便のNMRスペクトルの一例。
  
  図中の番号は同定された一部の代謝物を示す。1, lactate; 2, 3-fucosyllactose; 3, 2'-fucosyllactose; 4, acetate; 5, succinate; 6, 3'-sialyllactose; 7, galactose; 8, glucose; 9, lactose; 10, myo-inositol; 11, lactulose; 12, fumarate; 13, tyrosine; 14, phenylalanine; 15, formate
]
)<fig-feSpec>

#img(
  table(
    columns: 2,
    fill: none,
    stroke: none,
    inset: 5pt,

    [A],[B],
    image("Figures/fePCAc_Score.svg",),
    image("Figures/fePCAc_Loading.svg",),
    [C],[D],
    image("Figures/fePCAm_Score.svg",),
    image("Figures/fePCAm_Loading.svg",),
  ),
  caption: [
    母子糞便のPCA結果。
    
    A: 子糞便のPCAスコアプロット。B: ローディングプロット。（R2Y: 0.907, Q2: 0.866）C: 親糞便のPCAスコアプロット。D: ローディングプロット。（R2Y: 0.396, Q2: 0.118）スコアプロットは時期により色分けされている。b, 出産前24週; c, 出産直後; d, 生後1ヶ月; e, 生後4-5ヶ月；f, 生後8ヶ月；g, 生後1年半；h, 生後3年；k, 生後5年。
  ]
)<fig-fePCA>

#img(
  table(
    columns: 2,
    fill: none,
    stroke: none,
    inset: 5pt,

    [A],[B],
    image("Figures/feOPLSc_TimeCourseScore.svg",),
    image("Figures/feOPLSc_TimeCourseSLine.svg",),
    [C],[D],
    image("Figures/feOPLSm_TimeCourseScore.svg",),
    image("Figures/feOPLSm_TimeCourseSLine.svg",),
  ),
  caption: [
    母子糞便の時期別OPLS-R解析。
    
    A,C: スコアプロット（A: 子, C: 親）。スコアプロットは時期により色分けされている（b, 出産前24週; c, 出産直後; d, 生後1ヶ月; e, 生後4-5ヶ月；f, 生後8ヶ月；g, 生後1年半；h, 生後3年；k, 生後5年）。B, D: S-lineプロット（B: 子, D: 親）。横軸は#super[1]H-NMRのケミカルシフト、縦軸はビン積分値の変動量を示し、ピーク強度が大きいほど絶対値は大きくなる。色分けはグループ間スコアとの相関係数を示し、高いほど群分けに寄与すること示す。
  ]
)<fig-feOPLSR>

#img(
  table(
    columns: 2,
    fill: none,
    stroke: none,
    inset: 5pt,

    [A],[B],
    image("Figures/feOPLSc_sec1Score.svg",),
    image("Figures/feOPLSc_sec1SLine.svg",),
    [C],[D],
    image("Figures/feOPLSc_sec2Score.svg",),
    image("Figures/feOPLSc_sec2SLine.svg",),
    [E],[F],
    image("Figures/feOPLSc_sec3Score.svg",),
    image("Figures/feOPLSc_sec3SLine.svg",),
  ),
  caption: [
    子糞便のOPLS-DA。
    
    A,C,E: スコアプロット（Se+ vs Se-（上部））。A: 出産直後、C: 産後1ヶ月、E: 産後4-5ヶ月。

    B,D,F: S-lineプロット（Se+（下部） vs Se-（上部））。B: 出産直後、D: 産後1ヶ月、F: 産後4-5ヶ月。
  ]
)<fig-feOPLSDA>


= 謝辞
本研究を進めるにあたり熱心にご指導くださった、北海道大学 大学院先端生命科学研究院 蛋白質科学研究室の相沢智康教授、新井達也助教、並びに副査として貴重なご意見を頂きました自然免疫研究室の中村公則教授、生物情報解析科学研究室の菊川峰志准教授に心より御礼申し上げます。

NMR実験に関して多くのサポートをしていただきました久米田博之博士、熊木康裕博士、大西裕季博士、また実験手法や考察において多くのお力添えをいただきました森永乳業株式会社の和泉裕久様、田畑風華様に深く感謝申し上げます。

本研究を進めるにあたり、研究デザインや試料提供の調整などでご尽力いただきました、北海道大学医学研究院社会医学分野公衆衛生学教室の玉越暁子教授をはじめとした、岩見沢市母子健康調査研究グループの皆さまに厚く御礼申し上げます。並びに、本研究にご協力いただきました岩見沢市の皆様に心より感謝申し上げます。

様々な助言をいただいた蛋白質科学研究室の皆さま、研究室での生活において数々のご支援をいただきました技術補佐員の大貫しのぶ様に感謝の意を表します。
