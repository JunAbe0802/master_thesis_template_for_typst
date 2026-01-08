#import "./template.typ": *
#show: master_thesis.with(
  title: [
    岩見沢市母児健康調査 (SMILE Iwamizawa) 
    
    における母乳と乳児糞便の統合NMR
    
    メタボロミクス
  ],
  author: "阿部 潤",
  university: "北海道大学",
  school: "生命科学院",
  department: "ソフトマター専攻",
  term: "2025年度",
  lab: "蛋白質科学研究室",
  class: "修士",
)

= 概要
乳児期の環境が将来の健康に影響を与えるというDOHaD仮説において、腸内細菌叢はその鍵を握る因子である 。本研究では、母乳および母児糞便の代謝物プロファイルを包括的に解析することで、授乳期における栄養供給と代謝機能の発達過程を統合的に理解することを目的とした 。本論文では、岩見沢市母児健康調査（SMILE Iwamizawa）に参加する母児を対象に、核磁気共鳴（NMR）を用いたメタボローム解析を実施した 。

800 MHz NMR分光計を用いて、母乳および母児糞便の測定を行った 。スペクトルから母乳では51種類、糞便では76種類の代謝物を同定・定量した 。また、母親のFUT2遺伝的多型に基づき、2'-Fucosyllactose（2'-FL）の分泌型（Se+）と非分泌型（Se-）に分類し、多変量解析および単変量解析を用いて比較検討した 。

母乳メタボロームは産後の経過に伴いダイナミックに変動し、初乳ではHMOsが、産後数ヶ月では脂肪酸が高値を示した 。分泌型別解析では、Se+群で2'-FLとFucoseが、Se-群では3-FLが有意に高かった 。これはFUT2とFUT3による基質の競合的利用による影響を示唆している 。 乳児糞便メタボロームも成長に伴い変化し、産後早期には未消化のLactoseや単糖類が高値であった 。特筆すべき点として、Se+群の乳児糞便では2'-FLに加え、粉ミルク由来のLactuloseが有意に蓄積していた 。これは豊富なHMOsが優先的に細菌に利用された結果、Lactuloseの消費が抑制された可能性を示唆している 。

本研究により、母親の遺伝的多型が母乳成分のみならず、乳児の腸内代謝環境の形成にまで直接的かつ顕著な影響を及ぼしていることが明らかとなった 。

= 諸言
// *乳児の成長・便・腸内細菌について*
// - DOHaD仮説というものが存在する
//   - 乳児期に置かれた環境が成人後の生活習慣病リスクに影響を与える
//   - 腸内細菌叢も環境の一部で、成長・発達に影響を与える
// - 腸内細菌の形成過程
//   - 分娩時
//     - 経腟分娩か帝王切開かで大きく異なる
//   - 栄養状態
//     - 母乳育児か人工乳育児かで大きく異なる
//     - 抗菌薬投与
//   - 生活環境における微生物曝露
//     - ペットの有無、兄弟姉妹の有無
//   - 成長に伴う変化
//     - 出生後数週間は残存酸素が存在するので、好気性菌が優勢
//     - その後嫌気環境になり、ビフィズス菌が優勢
//     - 離乳すると植物性多糖類や動物性タンパク質を分解できる成人様の菌群（Bacteroidetes門、Firmicutes門）が急速に増加する。
//     - 3歳頃までに成人型の腸内細菌叢に近づく。その後は比較的安定。食習慣や抗菌薬投与などで変化することも。
// - 腸内細菌を調べるときに、糞便サンプルの*メタゲノミクス解析*だけでは不十分である→メタボロミクス解析も必要
//   - メタゲノミクスではその設計図を得ることしかできず、最終出力には繋がらない
//   - 活性や発現量が考慮されておらず、死菌のDNAも含まれる
//   - 同一人物由来のサンプルでも、メタゲノムはメタボロームより変動が大きい
//   - 機能的冗長性により、ある特定の菌株が増減しても、他の菌株がその機能を補完し、最終出力には影響を与えない場合がある
//     - 炎症性腸疾患（IBD）等の疾患状態における研究では、ショットガン・メタゲノミクスによって特定の分類群の増減が確認されたとしても、それに基づいて計算された代謝経路の機能的ポテンシャルには有意な差が見られないケースが報告されている。
//   - 食事・薬剤などの外的要因に対する応答がより反映される

乳児期における環境が将来の健康や疾病リスクに多大な影響を及ぼすという概念は、DOHaD（Developmental Origins of Health and Disease）仮説@hansonDevelopmentalOriginsHealth2015 として広く知られている。
腸内細菌叢もその環境因子の一つであり、子供の成長・発達に影響を与えることが示唆されている @stiemsmaRoleMicrobiomeDevelopmental2018 。
// なにか疫学的研究を示せると良い。
乳児の腸内細菌叢の形成過程は、分娩時、栄養状態、生活環境における微生物曝露、成長に伴う変化など、様々な要因によって規定される @borrego-ruizEarlylifeGutMicrobiome2025 @zhuShapingOralIntestinal2025 。
//   - 分娩時
//     - 経腟分娩か帝王切開かで大きく異なる
//   - 栄養状態
//     - 母乳育児か人工乳育児かで大きく異なる
//     - 抗菌薬投与
//   - 生活環境における微生物曝露
//     - ペットの有無、兄弟姉妹の有無
//   - 成長に伴う変化
//     - 出生後数週間は残存酸素が存在するので、好気性菌が優勢
//     - その後嫌気環境になり、ビフィズス菌が優勢
//     - 離乳すると植物性多糖類や動物性タンパク質を分解できる成人様の菌群（Bacteroidetes門、Firmicutes門）が急速に増加する。
//     - 3歳頃までに成人型の腸内細菌叢に近づく。その後は比較的安定。食習慣や抗菌薬投与などで変化することも。

腸内細菌叢の評価には、装置の簡便さから糞便サンプル中の細菌由来遺伝子を分析するメタゲノム解析が広く用いられてきた。
しかし、遺伝子情報のみでは細菌叢の機能を十分に評価できない可能性がある。
メタゲノム情報は細菌の種類や構成比を明らかにするが、実際の代謝活性は考慮されておらず、死菌のDNAも含まれるため、最終的な機能的出力を必ずしも反映しない。
また機能的冗長性により、ある特定の菌株が増減しても他の菌株がその機能を補完することで、最終的な出力には影響を与えない場合も考えられる。
実際に、炎症性腸疾患（IBD）などの疾患状態における研究では、特定の分類群の増減が確認されたとしても、それに基づいて計算された代謝経路の機能的ポテンシャルには有意な差が見られないケースが報告されている @jovelMetagenomicsMetatranscriptomicsMurine2022 。

したがって、腸内細菌叢の機能的な出力を評価するためには、メタゲノム解析に加えて他のオミクス解析を組み合わせることが重要である。
腸内細菌は代謝過程で短鎖脂肪酸などの低分子代謝物を放出するため、低分子代謝物の網羅的解析技術であるメタボローム解析を導入することで、細菌叢の機能的状態をより正確に把握することが可能となる。
また、同一個体由来のサンプルにおいて、メタボロームはメタゲノムよりも変動が小さいことが報告されており @sangermaniStabilityFecalMetabolites2024 、メタボローム解析は腸内細菌叢の機能的な評価においてより安定した指標を提供する可能性がある。
さらに、食事や薬剤に対する応答がメタボロームにより強く反映されることも示されており @zhangEffectsMetforminGut2020 、外的要因に対しての応答をより詳細に解析することにも貢献しうる。
したがって、腸内細菌叢の機能的な理解を深めるためには、メタゲノム解析に加えてメタボローム解析を組み合わせることが重要である。


// *母乳について*
// - 母乳育児は大事である
//   - 疫学的に影響を与えているデータが欲しい
// - 母乳中には色々な成分がある
//   - 脂質、蛋白質、炭水化物、抗体、ビタミン、ミネラル
//   - 代謝物も大事
//   - とくにHMOs
//     - 乳児の腸内細菌叢形成に重要
//     - 2'-FLのシェアが大きく、FUT2遺伝子の分泌型/非分泌型が影響を与える
//     // 2'-FLは代表的なHMOsの一つで、LactoseにFucoseがα1,2結合したオリゴ糖であり、その合成には_FUT2_遺伝子にコードされるα1,2-フコシルトランスフェラーゼ（FUT2）が関与している。FUT2の活性には遺伝的多型が影響を与え、分泌型（Se+）の個体は2'-FLを豊富に分泌し、HMOs全体の約30%を占める @vanniekerkHumanMilkOligosaccharides2014 。一方、非分泌型（Se-）の個体は2'-FLをほとんど分泌しないことが知られている。// 引用文献を追加。
// - マクロ栄養素についてはよく調べられている
//   - 時系列変化が存在する
// - 母乳は乳児が摂取する唯一の栄養→腸内細菌のえさとして重要

母乳は乳児期における理想的な栄養源であり、母乳育児は乳児の健康維持や発達において極めて重要な役割を担う。
授乳期間の長さが、言語能力、認知機能、および運動能力の発達に正の影響を及ぼし得ることが、疫学的観点からも報告されている @goldshteinBreastfeedingDurationChild2025
そのため、世界保健機関（WHO）や国際連合児童基金（UNICEF）は、生後6ヶ月間までの完全母乳育児を推奨しており、その後も2歳までは適切な補完食を併用しつつ母乳育児を継続することを提唱している @worldhealthorganizationEssentialNutritionActions2019 。
母乳が多機能な役割を果たす背景には、脂質、タンパク質、炭水化物、ビタミン、ミネラルといった主要な栄養素に加え、抗体や低分子代謝物などの多様な生物活性成分が含まれていることが挙げられる @andreasHumanBreastMilk2015 。
これらの成分は乳児の成長や免疫機能の発達に寄与し、その組成や含有量は授乳期間に応じて動的に変化する @kimComponentsHumanBreast2020 。

特に、乳児の腸内細菌叢形成において重要な役割を担う低分子代謝物として、ヒトミルクオリゴ糖（Human Milk Oligosaccharides; HMOs）が挙げられる。HMOsは、グルコース、ガラクトース、N-アセチルグルコサミン、フコース、シアル酸などの単糖が複雑に結合した構造を持ち、その種類は200を超えるとされる @thurlSystematicReviewConcentrations2017 。
乳児の消化管はHMOsを分解する酵素を保持していないため、これらは未消化のまま大腸へと到達する。
特定のビフィズス菌はHMOsを分解・利用する能力を有しており、HMOsはこれら有益菌の増殖を優先的に促進するプレバイオティクスとして機能する @borewiczEffectPrebioticFortified2019 。
加えて、HMOsは乳児の細胞表面の糖鎖に類似した構造を持つため、病原体が宿主細胞へ結合するのを競合的に阻害し、感染を防御する抗感染作用も報告されている@rousseauxHumanMilkOligosaccharides2021a 。

HMOsの中で最も含有量が多い成分は2'-Fucosyllactose (2'-FL)であり、総HMOsの約30%を占める@vanniekerkHumanMilkOligosaccharides2014 。
2'-FLの合成には、FUT2遺伝子にコードされる$alpha$1,2-フコシルトランスフェラーゼ（FUT2）が関与している。
FUT2の活性には遺伝的多型（分泌型/非分泌型）が関与しており、分泌型（Se+）の個体は母乳中に2'-FLを豊富に分泌する一方、非分泌型（Se-）の個体は2'-FLをほとんど分泌しない。
このSe+/Se-の比率は人種によって異なり、日本人集団ではSe+が約80%を占めることが知られている @kodaMolecularBasisSecretor1996 。
こうした母体の遺伝的多型に起因する母乳中のHMOs組成の差異は、乳児の腸内細菌叢の定着や形成過程に直接的な影響を及ぼす可能性が示唆されている@lewisMaternalFucosyltransferase22015 @matsukiKeyGeneticFactor2016 。

乳児期の腸内環境形成プロセスを統合的に理解するには、供給源である母乳と、その代謝的出力である母児糞便の双方の代謝物プロファイルを同時に明らかにすることが不可欠である。
しかし、ヒトを対象とした研究においては、コホートの希少性や高度な分析リソースの制約から、その動態や相互作用の詳細は依然として十分に解明されていない。
そこで本研究では、授乳期における母乳および母児の糞便代謝物の経時的な変動、ならびにそれらの相関関係を明らかにすることを目的とした。
本論文では、北海道岩見沢市で実施中の前向き母児コホート研究「岩見沢市母児健康調査（SMILE Iwamizawa）」 @komatsuAssociationsMaternalDiet2023 に参加する母親とその乳児を対象とし、核磁気共鳴（NMR）を用いたメタボローム解析により、母乳および糞便中の代謝物動態を包括的に評価した。

// NMRでやったことを強調してもいいと思うけど、一旦後回し

= 材料と方法
== 実験デザイン
本研究は、北海道岩見沢市で実施中の前向きコホート研究である、岩見沢市母児健康調査（SMILE Iwamizawa）@komatsuAssociationsMaternalDiet2023 の一環として実施された。
本調査は、健康な妊婦を対象に、妊娠中の環境の把握から始め、出産、乳児期から幼児期、学童期まで子供の生活習慣、健康状態を調査することで、子供の成長発達に影響を与える因子や、近年増加している子どものアレルギーや肥満などの様々な疾患の原因を明らかにすることを目的としている。

本研究はヘルシンキ宣言の精神に則り実施された。
ヒトを対象とする全ての実施手順は、北海道大学大学院医学研究院医の倫理委員会（承認番号：16-039）および森永乳業倫理委員会（承認番号：16005-144）の承認を得ている。
岩見沢市在住の妊婦が母児健康手帳の交付を受ける際に、本調査に関する説明を行い、書面によるインフォームド・コンセントを得た。
なお、乳児の研究参加については、代諾者である母親の同意をもってこれに代えた。
同意を得られた参加者（母、子）に対して、調査票などによる調査や母乳・糞便の採取を実施した。
採取された試料は速やかに -20$degree$C で保管され、採取から約1ヶ月以内に分析時まで -80$degree$C で凍結保存された。参加者の臨床的特性については、@tbl-basicInfo に、サンプルの採取時期およびサンプル数については、@tbl-sampleInfo に示す通りである。
また、授乳期の栄養方法について、分泌型/非分泌型別での状況については、@fig-nutrition に示す通りである。

== サンプル調製
=== 母乳<sec4.2.1>
解凍した母乳試料 1 mL を、15,000 rpm、4$degree$C で30分間遠心分離し、脂質層と水層を分離させた。回収した水層画分 400 μL を、分子量 5 kDa 以上の高分子除去用遠心式限外ろ過フィルターユニット（UFC3LCCNB-HMT; Human Metabolome Technologies, Tsuruoka, Japan）に充填し、9,100 $times$g、4$degree$C で完全にろ過されるまで遠心を行った。なお、フィルターユニットの洗浄のため、事前に超純水 300 μL を用いた遠心（9,100 $times$g、4$degree$C、30分間）を3回繰り返した。 得られたろ液 270 μL に対し、超純水 270 μL および NMR 測定用緩衝液 60 μL（pH 7.4, 50 mM Sodium phosphate, 0.5 mM 3-(trimethylsilyl)propionic acid-d4 sodium salt (TSP), 0.04% NaN#sub[3], 1 mM formate, 10% D#sub[2]O；濃度はすべて終濃度）を添加した。この混合液 600 μL のうち 540 μL を外径 5 mm の NMR 試料管（SJ-5; Shigemi, Hachioji, Japan）に充填した。その後、試料中の溶存酸素を除去するため、試料管を超音波洗浄機に数秒間供し、脱気を行った。

=== 母児糞便
凍結保存された糞便試料を 4$degree$C で解凍し、スパーテルを用いて2分間均一に撹拌した後、約 200 mg を分注した。
秤量した試料重量に対して10倍量の NMR 測定用緩衝液（組成は #ref(<sec4.2.1>)と同一）を添加し、1,800 rpm、4$degree$C で15分間振とう抽出を行った。
抽出後、13,000 rpm、4$degree$C で5分間遠心分離し、上清約 1.5 mL を回収して -80$degree$C で保存した。
測定直前に 4$degree$C で再解凍し、15,000 rpm、4$degree$C で10分間遠心分離した後の上清 540 μL を、外径 5 mm の NMR 試料管（SJ-5; Shigemi, Hachioji, Japan）に充填した。

== NMR測定 <sec4.3>
NMR スペクトルの測定には、CryoProbe#super[TM] および SampleJet を装着した Bruker Avance Neo 800 MHz 分光計を用い、すべての測定を 25$degree$Cで実施した。
パルスシーケンスにはプレサチュレーション付き1次元 #super[1]H NOESY（noesypr1d）を用いた。
主な測定パラメータは、観測範囲 12 ppm, データポイント数 65,536、ダミースキャン回数 8回、積算回数 128回、取り込み時間 3.4秒、待ち時間 1.6秒、NOE混合時間 0.1秒とした。

== スペクトル処理・濃度定量
スペクトルデータの処理および濃度定量には、Chenomx NMR Suite 12.0（Chenomx Inc., Edmonton, Canada）を用いた。
Chenomx Processor により、0.3 Hz のラインブロードニングを適用した指数関数をウィンドウ関数として乗じ、データポイント数が 262,144 となるようにゼロフィリングを行った後、フーリエ変換を実施した。
位相およびベースラインを手動で補正し、全スペクトルを TSP の信号強度に基づいて規格化した。

=== 母乳
Chenomx Profiler を用い、内蔵データベースを基に代謝物の同定と濃度定量を行った。
データベースに未登録の代謝物については、標準物質を同一条件で測定（@sec4.3 参照）したスペクトルをリファレンスとして同定・定量を実施した。

また、濃度定量の解析者による系統誤差を最小限に抑えるため、本作業の解析手順を統一し、文書化した。
解析手順の統一性を評価するため、異なる5人の解析者が同一試料セット（n=4）を解析し、その定量値について、主成分分析（PCA）および、Bland-Altman分析を実施した。

また、2'-FL分泌型/非分泌型の比較を目的に、2'-FL濃度 0.1 mM を閾値として、Se+群（2'-FL濃度 > 0.1 mM）とSe-群（2'-FL濃度 ≤ 0.1 mM）に分類した。

=== 母児糞便
Chenomx Profiler を用いてスペクトルのビニングを行い、各ビン領域の信号強度総和を算出した。
ビンの幅は 0.02 ppm とし、化学シフト範囲は 0 ppm から 10 ppm までとした。ただし、水信号領域（4.68 ppm ～ 4.88 ppm）は解析から除外した。

== 統計解析
母乳の濃度データおよび母児糞便のビニングデータを用い、多変量解析ソフト SIMCA 18（Sartorius, Umeå, Sweden）にて多変量解析を実施した。
各変数は平均 0、分散 1 となるように標準化（Unit variance scaling）を行い、PCAおよび直交部分的最小二乗回帰分析（OPLS-DA/R）を実施した。
群間の統計学的比較には、Welch の t検定法を用いた。

= 結果
== 母乳の#super[1]H-NMR測定及び代謝物同定・定量<sec5.1>
すべてのサンプルにおいて、シグナル強度が十分で明瞭な#super[1]H-NMRスペクトルを取得した（@fig-bmSpec）。
代謝物の同定は、スペクトル上の各ピークの帰属およびChenomx内データベースとの照合により行い、最終的に計51種類の代謝物を同定・定量した。同定された全代謝物の平均濃度は、@fig-bmConc に示す通りである。

== 母乳中代謝物の定量における解析者間の系統誤差の評価
@sec5.1 における定量解析において、解析者間の手技に起因する系統誤差を最小化するため、解析プロトコルの統一とその妥当性評価を実施した（@fig-bmManual）。PCAスコアプロット（@fig-bmManual A）において、5名の解析者が同一の試料セット（n=4）を独立して解析した結果、各データ点は解析者によらず近接してプロットされており、クラスターの形成が確認できた。そのためPCAによる評価では、解析者間で顕著な差異がないことが示された。

また、Bland-Altman分析（@fig-bmManual B）により、全解析者の定量値の平均値と各解析者の値との乖離を評価したところ、大半の代謝物が95%一致限界（Limits of Agreement）内に収まっていた。以上の結果から、本研究における解析手順は十分な再現性を有しており、解析者間の系統誤差は無視できるほど小さいことが確認された。したがって、以降の解析には、この統一された手順に基づいて算出された定量値を用いることとした。

== 産後時期別の母乳中メタボローム解析<sec5.3>
母乳中メタボロームの経時的な変化を俯瞰的に評価するため、代謝物の濃度定量値に基づいた主成分分析（PCA）を実施した（@fig-bmPCA）。採取時期別に色分けしたスコアプロットの結果、初乳、産後1ヶ月、および産後4–5ヶ月の各群において、明確なクラスターの形成が認められた。

第1主成分（PC1）および第2主成分（PC2）は、主に初乳とそれ以外の群（産後1ヶ月・4–5ヶ月）の分離に寄与していた。ローディングプロットの解析から、2'-Fucosyllactose (2'-FL)、3'-Sialyllactose (3'-SL)、6'-Sialyllactose (6'-SL) といったヒトミルクオリゴ糖（HMOs）や _myo_-Inositol が、初乳群を特徴付ける主要な代謝物であることが示された。対して、産後1ヶ月および4–5ヶ月群では、主要なエネルギー源である Lactose や、Butylate、Caprate、Caprylateなどの脂肪酸が特徴的であった。

また、第3主成分（PC3）は、産後1ヶ月群と4–5ヶ月群の分離に寄与していた。産後1ヶ月群では、HMOsの一種である 3-Fucosyllactose (3-FL) や、Lactate、Pyruvate などの有機酸が相対的に高値を示した。一方、産後4–5ヶ月群では Citrate や _O_-Phosphocholine が特徴的な代謝物として同定された。

== 分泌型/非分泌型における母乳中メタボロームの差異
@sec5.3 におけるPCAおよび単変量解析の結果、2'-FLの濃度変動が顕著であった。そこで、2'-FLに注目した詳細な解析を行うため、分泌型（Se+）群および非分泌型（Se-）群を目的変数とした判別分析（OPLS-DA）を実施した（@fig-bmOPLSDA）。
本解析の対象において、Se+群の個体は110名（81%）、Se-群は26名（19%）であり、日本人集団における 2'-FL 分泌型の頻度が約80%であるという既報と一致していた @kodaMolecularBasisSecretor1996 。
構築されたOPLS-DAモデルは良好な分離能を示し（@fig-bmOPLSDA A）、ローディングプロットおよびVIP（Variable Importance in Projection）スコアの解析から、Fucose および 2'-FL がSe+群を、3-FL がSe-群をそれぞれ特徴付ける主要な代謝物であることが示された（@fig-bmOPLSDA B）。なお、これら以外の代謝物については、両群間で特徴的な差異は認められなかった。

続いて、母乳中の2'-FL、3-FL、および Fucose 濃度に対する分泌型／非分泌型の影響をより詳細に検討するため、産後時期別に単変量解析を実施した（@fig-bmSecConc）。その結果、すべての時期において、2'-FL および Fucose 濃度はSe+群で有意に高く、逆に 3-FL 濃度はSe-群において有意に高値を示した。これらの代謝物濃度には、群間で2倍以上の顕著な差異があることが確認された。


== 糞便の#super[1]H-NMR測定及び代謝物同定
すべてのサンプルにおいて、解析に十分なシグナル強度を有する明瞭な#super[1]H-NMRスペクトルを取得した（@fig-feSpec）。代謝物の同定は、スペクトル上のシグナルパターンの解析およびChenomx内データベースとの照合により行い、最終的に計76種類の代謝物を同定した。

== 母児糞便中メタボロームの主成分分析
母児それぞれの糞便メタボロームの時期的な変遷を俯瞰的に評価するため、NMRスペクトルのビン積分値データを用いた主成分分析（PCA）を実施した（@fig-fePCA）。

乳児の糞便サンプルにおいて、採取時期別に色分けしたスコアプロットを作成したところ、成長に伴う明確なクラスターの形成が認められた。具体的には、第1主成分（PC1）の寄与により、日齢の低い「出産直後および産後1ヶ月」の群と、離乳が進んだ「産後1.5年以降」の各群が、それぞれ特徴的な領域にクラスターを形成して分布していた。
そして、その間を産後4ヶ月から8ヶ月の群が連続的に結ぶような分布を示していた。
一方、母親の糞便サンプルにおいては、乳児で見られたような産後時期に伴う明確なクラスター形成や、経時的なメタボローム構成の変化は認められなかった。また、母児いずれのサンプルにおいても、母体の FUT2 遺伝的多型の違いに基づく明確な分離は確認されなかった。

== 母児糞便中メタボロームの産後時期によるOPLS-R解析
母児それぞれの糞便中メタボロームにおける経時的な変動をより詳細に評価するため、サンプルの採取時期を目的変数とした直交部分最小二乗回帰（OPLS-R）解析を実施した（@fig-feOPLSR）。
乳児の糞便においては、@fig-feOPLSR A に示す通り、適合度および予測精度の高い回帰モデルを構築することができた。S-lineプロット（@fig-feOPLSR B）を用いた解析の結果、Glucose、Lactose、Galactose などの糖類や _myo_-Inositol が、産後早期の糞便を特徴付ける主要な代謝物であることが示された。
母親の糞便中メタボロームについても、産後時期を目的変数とした回帰モデルを構築した（@fig-feOPLSR C）。S-lineプロット（@fig-feOPLSR D）の解析からは、Aspartateが産後後期の糞便において相対的に高い寄与を示す代謝物として同定された。
// aspartate: 2.83ppm
// L-dopa (6.79 ppm)が出産後後期に特徴的かもしれない。周辺ビンは特徴的としてカウントされている。
// 
// 考察ポイント
// 乳児糞便での糖類が初期で出てくるのは、母乳の糖類が未消化で出てくるから？
// myo-Inositolは母乳中に多く出てくるからそれが反映されている？でもなんで町内に残っているかは不明すぎる

== 分泌型/非分泌型における母児糞便中メタボロームの差異
母体の FUT2 遺伝的多型が、母児それぞれの糞便中メタボロームに及ぼす影響を評価するため、Se+群およびSe-群を目的変数とした判別分析（OPLS-DA）を実施した（@fig-feOPLSDA）。

乳児の糞便については、出産直後、生後1ヶ月、および生後4-5ヶ月の各時期において、良好な判別能を有するモデルを構築することができた（@fig-feOPLSDA A, C, E）。S-lineプロットを用いた解析の結果、出産直後（@fig-feOPLSDA B）においては、2'-FL および Lactulose がSe+群を、3-FL および Inosine がSe-群をそれぞれ特徴付ける主要な代謝物として同定された。生後1ヶ月（@fig-feOPLSDA D）においても同様の傾向が認められ、2'-FL および Lactulose がSe+群において特徴的であった。また、生後4-5ヶ月においては、Inosine がSe-群を特徴付ける代謝物として抽出された。
一方で、離乳が進む生後8ヶ月以降の乳児糞便、およびすべての時期の母親糞便においては、分泌型/非分泌型による明確なグループ間の分離は認められなかった。
// 考察ポイント
// 2'-FLと3-FLは母乳メタボライトを反映しているんだと思う
// LactuloseがSe+で高いのは腸内で使い切れないから？
// InosineはSe-で高いのはなぜ？母乳中にはほとんど含まれていない。

= 考察
本研究では、前向き母児コホート研究「岩見沢市母児健康調査」の参加者を対象とし、NMR法を用いたメタボローム解析を実施することで、母乳および母児糞便における代謝物動態の包括的な評価を試みた。母乳の成分組成と母児の腸内代謝環境の変化を統合的に解析した本成果は、乳児期における栄養供給と代謝機能の発達過程を理解する上で重要な知見を提供するものである。

母乳メタボローム解析の結果、産後の経過に伴いその組成がダイナミックに変動することが明らかとなった。特にHMOsである 3′-SL、6′-SL、および 2′-FL は、授乳期間の進行とともに顕著な減少を示した。この傾向は先行研究の報告とも一致しており、@kortesniemi1HNMRMetabolomics2022 @poulsenDynamicChangesHuman2022 乳児の成長段階に応じた免疫調節や、初期腸内細菌叢形成におけるプレバイオティクスとしての役割を反映していると考えられる。
先行研究では、2′-FL や 3′-SL が乳児の神経発達スコア（ASQ-3）や頭囲と正の相関を示すことや@satoAbsoluteQuantificationEight2024a 、6′-SL が社会性の発達指標（ASQ:SE-2）と相関し、脳の関連領域における髄鞘形成を促進すること@rajhansRoleHumanMilk2023 が報告されている 。
本コホートは学童期までの追跡調査が継続中であり、今後、頭囲などの発達指標と本研究で得られた代謝物データとの関連性を詳細に検証する予定である。

また、授乳期間の経過に従い増加した代謝物として、短鎖脂肪酸（Short Chain Fatty Acids; SCFAs）であるButylateや、中鎖脂肪酸（Midium Chain Fatty Acids; MCFAs）であるCaprate、Caprylateなどの脂肪酸が同定されており、これらの傾向も既報と一致している @sundekildeEffectGestationalLactational2016 @poulsenDynamicChangesHuman2022 。MCFAs はエネルギー源としての機能に加え、免疫系への調整作用や腸内細菌叢への影響も指摘されている成分である @roopashreeEffectMediumChain2021 。母乳の脂肪酸組成は母親の食習慣を反映することが知られており、例えば低脂肪食を摂取する母親では母乳中の MCFAs が増加するという報告も存在する @nasserEffectControlledManipulation2010 。本コホートは母児の食習慣について、簡易型自記式食事歴法質問票（Brief Diet History Questionnaire; BDHQ） @sasakiFoodNutrientIntakes を用いた母親の栄養調査も実施されているため、今後は食事内容と母乳代謝物プロファイルとの相関関係についても解析を深めていく。

母体の FUT2 遺伝的多型（分泌型/非分泌型）が母乳中メタボロームに及ぼす影響を検討したところ、Fucose および 3-FL の濃度において顕著な群間差が認められた。Se+群では Fucose が高値を示したのに対し、Se-群では 3-FL が高値を示した。
2'-FL及び3-FLはともにLactoseにFucoseが結合した構造を持つが、前者は$alpha$1,2-結合、後者は$alpha$1,3-結合と、その結合様式が異なる。FUT2 は 2'-FL の合成を担う一方で、3-FL の合成には関与せず、後者の合成には$alpha$1,3-フコシルトランスフェラーゼ（FUT3）が関与する。すなわち、両酵素は同一の基質を共有しており、2'-FL と 3-FL の合成は競合的な関係にあると推察される。

Se-群において 3-FL が高値を示した要因として、FUT2 の機能低下により 2'-FL の合成が抑制された結果、基質が 3-FL 合成経路へとシフトしたことが考えられる。
_Bifidobacterium_属による利用において、2′-FL と 3-FL は同一の輸送体および代謝経路を共有することが報告されていることから@jamesMetabolismPredominantHuman2019a 、Se-群における 3-FL の増加は、2′-FL の欠乏を機能的に補完している可能性が示唆される。ただし、細菌種によってはいずれかのオリゴ糖を選択的に利用する場合もあるため、今後は菌叢データとの照合による検証が必要である。

また、Se+群で Fucose が高値であった理由については、Se-群での生成制限や Se+群での分解亢進といったフィードバック機構の関与が想定され、これにはトランスクリプトーム解析等を用いた分子レベルでの追究が求められる。なお、フコース代謝に関連する成分以外に顕著な差異が見られなかった事実は、FUT2 遺伝的多型が母乳メタボローム全体に及ぼす影響は、主要な HMOs の組成変化に限定的であることを示していると考えられる。

母体の糞便メタボロームが産後時期を通じて安定していたのに対し、乳児の糞便メタボロームは動的な変遷を遂げることが判明した。特に産後早期の乳児糞便において Lactose、Glucose、Galactose が高値を示した点は注目に値する。乳児の消化吸収機構は出生直後は未熟であり、離乳に向けて徐々に成熟していく @TengTianXinShengErQiRuYinQiLiRuQiniokeruChangnoXiShouJiGou2010。母乳中の主要な糖成分である Lactose は、小腸微絨毛膜のラクターゼにより加水分解されるが、消化機能が未発達な時期には未分解の Lactose やその分解産物である単糖類が完全に吸収されず、糞便中へと排出された結果であると考えられる。

母体の FUT2 遺伝的多型は、離乳前の乳児糞便中メタボロームにも顕著な影響を及ぼし、2′-FL、3-FL、Lactulose、Inosine などの濃度差として反映された。
Se+群で高値を示した2′-FL および Se-群で高値を示した3-FL の動態は母乳中の濃度差を直接反映したものと考えられる。
一方でSe+群の糞便中で高値を示した Lactulose は母乳にはほとんど含まれず、主に粉ミルクに由来する成分である @beachLACTULOSEOTHERNONABSORBABLE1983 。
本コホートの約半数が混合育児であったことを踏まえると、Se+群の乳児において粉ミルク由来の Lactulose が高頻度に検出されたことになる。
LactuloseはHMOsと同様に_Bifidobacterium_属を始めとした腸内細菌に利用されることが知られている@rasoulimehrabaniLactuloseSelectivelyStimulates2025。
そのため、Se+群では 2′-FL 等の豊富な HMOs が優先的に細菌に利用されることで、Lactulose が利用されずに残存した可能性、あるいは腸内細菌の代謝能を上回る糖類が供給された可能性が考えられる。
Lactulose を利用可能な細菌群は 他のHMOsに比べ多岐にわたるため@maoVitroFermentationLactulose2014 、その蓄積メカニズムと腸内細菌叢の構成との関連については、さらなる解析が不可欠である。

// *糞便・時系列*
// - 乳児糞便でlactose, glucose, galactoseが前期に多く出てくる
//   - lactose -> glucose + galactose
//   - 母乳中の糖が未消化で出てきている
//   - 初期は消化吸収能力が低い
// - 母親糞便でaspartateが後期に多く出てくる（https://ccpat.net/ccpat/wp-content/uploads/2020/05/FCCSOBBook-2017-Ch01-Physiologic-Changes-During-Pregnancyen-ja.pdf ）
//   - 出産直後のアスパラギン酸アミノトランスフェラーゼの低下が有名らしい
//     - 反映しているならこの酵素はアスパラギン酸をつくる反応なので、アスパラギン酸が増えるのは納得できる
//     - でも対となる反応のアラニンアミノトランスフェラーゼ関連は何も出てないからコレは違うかもしれん
//   - 出産時はプロテオバクテリア門が増えて、出産後徐々に減少していく
//     - プロテオバクテリアはアスパラギン酸が餌になる
// *糞便・分泌型*
// - 乳児糞便で2'-FL, 3-FL, Lactulose, Inosineが分泌型/非分泌型で差が出ている
//   - 2'-FL, 3-FLは母乳中の影響を反映している
//   - Lactuloseはなぜか分泌型で高い
//     - 母乳中にはほとんど含まれておらず、粉ミルク中にいる
//       - 混合育児と母乳のみが半々くらい
//     - 全体的なHMOsの摂取量が多いと、腸内細菌が使い切れずに一部が糞便中に出てきている？
//   - Inosineはなぜか非分泌型で高い（https://chatgpt.com/share/6958fb1a-785c-8006-be9a-1dd03a5d7b71 ）
//     - 母乳中にはほとんど含まれていない
//     - 非分泌型ではInosine産生菌が多い？
//       - ビフィズス菌がイノシン産生する
//       - 細菌叢解析の結果と付き合わせたい
//     - 代謝経路がシフトし、核酸・ヌクレオチドをエネルギー源として使うようになると、イノシンが増える？AMP→Inosine
//       - HMOsが少ないから、他のエネルギー源を使うようになる？

= 結論
本研究では、SMILE Iwamizawaコホートの母乳および母児糞便サンプルのNMRメタボローム解析を通じ、授乳期における代謝動態を包括的に明らかにした 。

母乳サンプルの解析からは、授乳期間の進行に伴い主要な代謝物構成がシフトすることを捉え、母乳組成の動的変化を解明した。
母児の糞便サンプルの解析からは、産後期間において、母体の糞便メタボロームが安定していたのに対し、乳児では顕著な動的変遷が確認され、産後早期の乳児糞便における乳糖および単糖類の高値は、新生児期の未熟な消化吸収能を反映していることを示した。
また、母親のFUT2遺伝的多型（分泌型/非分泌型）が母乳中のHMO組成を決定づけるだけでなく、離乳前の乳児糞便中の2'-FL、3-FL、Lactulose等の代謝物プロファイルにも顕著な差をもたらすことを突き止めた 。

以上の結果は、母体の遺伝的背景を考慮したパーソナライズされた育児支援や、乳児の健やかな成長に寄与する栄養戦略の構築において極めて重要な基盤情報となる。今後は、本研究で得られた代謝物データと腸内細菌叢データ、さらには学童期まで続く発達指標との関連性を詳細に検証することで、DOHaD仮説の分子メカニズムの解明を目指す 。

= 参考文献
#text(lang: "en")[
  #bibliography("references.bib", title: none, style: "nature")
]

= 図表
#show outline.entry: it => {
  
  it
}
#outline(
  target: figure,
  title: none,
)

#let table_subjectFeature = csv("./tables/subjectFeature.csv")
#figure(
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
  caption: "研究参加者の母児特性および臨床的背景",
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
#figure(
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
    母乳および母児糞便サンプルの採取時期と解析数
  ],
)<tbl-sampleInfo>
\- はサンプル未採取を示す。

#figure(
  [
    #image(
      "Figures/nutrients_Se+.svg"
    )
    #image(
      "Figures/nutrients_Se-.svg"
    )
  ],
  caption: [
    分泌型（Se+）および非分泌型（Se-）別での授乳期の栄養方法
  ]
)<fig-nutrition>

#pagebreak()
#figure(
  [
    #image("Figures/10016010mMd_BM00541_1.svg", width: 67%)
    #image("Figures/10016010mMd_BM00541_2.svg", width: 67%)
    #image("Figures/10016010mMd_BM00541_3.svg", width: 67%)
    #box(width: 100%)
  ],
  caption: [
    母乳サンプルの代表的な #super[1]H-NMR スペクトル
  ]
)<fig-bmSpec>
図中の番号は同定された代謝物を示す。1, Caprate; 2, Caprylate; 3, Butyrate; 4, Isoleucine; 5, Leucine; 6, 2-Aminobutyrate; 7, Valine; 8, 3-Fucosyllactose; 9, 2'-Fucosyllactose; 10, Fucose; 11, Threonine; 12, Lactate; 13, Alanine; 14, 6'-Sialyllactose; 15, 3'-Sialyllactose; 16, Acetate; 17, Proline; 18, Glutamate; 19, Acetate; 20, Pyruvate; 21, Succinate; 22, Glutamine; 23, Citrate; 24, Aspartate; 25, Asparagine; 26, 2-Oxoglutarate; 27, Lysine; 28, Creatine; 29, Creatine phosphate; 30, Creatinine; 31, _cis_-Aconitate;, 32, Ethanolamine; 33; Choline; 34, _O_-Phosphocholine; 35, _sn_-Glycero-3-phosphocholine; 36, Glucose, 37, Betaine; 38, Lactose; 39, Methanol; 40, Taurine; 41, Fucose;, 42, Glycine; 43, _myo_-Inositol; 44, Urea; 45, Fumarate; 46, Tyrosine;, 47, Histidine; 48, Tryptophan; 49, Phenylalanine, 50, Uridine; 51, Formate.


#figure(
  image(
    "Figures/mean_concentration_barplot.svg",
  ), 
  caption: [同定・定量された母乳中代謝物の平均濃度プロファイル]
)<fig-bmConc>
エラーバーは標準偏差（SD）を示す。各代謝物の平均値およびばらつきを算出した。

#pagebreak()
#figure(
  grid(
    columns: (1em, 1.3fr, 1em, 1em, 2fr),

    [A],
    image(
      "Figures/bmPCAmanual_Score.svg", 
      // width: 66%
    ),
    h(1em),
    [B],
    image(
      "Figures/bmPCAmanual_blandaltman.svg", 
      // width: 85%
    )
  ),
  caption: [
    解析手順の統一による母乳代謝物定量値の解析者間誤差の評価
  ]
)<fig-bmManual>
A: 主成分分析（PCA）スコアプロット。5人の解析者が同一試料セット（n=4）を解析した結果を示す。B: Bland-Altman分析。各代謝物について、5人の解析者が得た濃度定量値の平均値と、各解析者の定量値と平均値との差をプロットした。橙線は平均差の95%信頼区間を、緑線は2つの測定方法の誤差の許容範囲（limits of agreement; LOA）を示し、「差の平均値±1.96×差の標準偏差」で表される。

#figure(
  image(
    "/Figures/bmPCA_timeCourse.svg",
    width: 100%,
  ),
  caption: [
    産後時期に基づく母乳中メタボロームの主成分分析（PCA）
]
)<fig-bmPCA>
左：スコアプロット。右：ローディングプロット。

// #figure(
//   grid(
//     columns: 4,

//     image("Figures/bmUnivariate/2'-fucosyllactose_timingStats.svg",),
//     image("Figures/bmUnivariate/3'-sialyllactose_timingStats.svg",),
//     image("Figures/bmUnivariate/3-fucosyllactose_timingStats.svg",),
//     image("Figures/bmUnivariate/6'-sialyllactose_timingStats.svg",),
//     image("Figures/bmUnivariate/Fucose_timingStats.svg",),
//     image("Figures/bmUnivariate/Galactose_timingStats.svg",),
//     image("Figures/bmUnivariate/Glucose_timingStats.svg",),
//     image("Figures/bmUnivariate/Lactose_timingStats.svg",),
//   ),
//   caption: [
//     糖類の経時変化による母乳中代謝物濃度の比較。
//   ]
// )<fig-bmSugar>

// #figure(
//   grid(
//     columns: 5,

//     image("Figures/bmUnivariate/2-Aminobutyrate_timingStats.svg",),
//     image("Figures/bmUnivariate/Alanine_timingStats.svg",),
//     image("Figures/bmUnivariate/Asparagine_timingStats.svg",),
//     image("Figures/bmUnivariate/Aspartate_timingStats.svg",),
//     image("Figures/bmUnivariate/Betaine_timingStats.svg",),
//     image("Figures/bmUnivariate/Glutamate_timingStats.svg",),
//     image("Figures/bmUnivariate/Glutamine_timingStats.svg",),
//     image("Figures/bmUnivariate/Glycine_timingStats.svg",),
//     image("Figures/bmUnivariate/Histidine_timingStats.svg",),
//     image("Figures/bmUnivariate/Isoleucine_timingStats.svg",),
//     image("Figures/bmUnivariate/Leucine_timingStats.svg",),
//     image("Figures/bmUnivariate/Lysine_timingStats.svg",),
//     image("Figures/bmUnivariate/Methionine_timingStats.svg",),
//     image("Figures/bmUnivariate/Phenylalanine_timingStats.svg",),
//     image("Figures/bmUnivariate/Proline_timingStats.svg",),
//     image("Figures/bmUnivariate/Taurine_timingStats.svg",),
//     image("Figures/bmUnivariate/Threonine_timingStats.svg",),
//     image("Figures/bmUnivariate/Tryptophan_timingStats.svg",),
//     image("Figures/bmUnivariate/Tyrosine_timingStats.svg",),
//     image("Figures/bmUnivariate/Urea_timingStats.svg",),
//     image("Figures/bmUnivariate/Valine_timingStats.svg",),  
//   ),
//   caption: [
//     アミノ酸及びその関連代謝物の経時変化による母乳中代謝物濃度の比較。
//   ]
// )<fig-bmAmino>

// #figure(
//   grid(
//     columns: 4,

//     image("Figures/bmUnivariate/2-Oxoglutarate_timingStats.svg",),
//     image("Figures/bmUnivariate/Acetone_timingStats.svg",),
//     image("Figures/bmUnivariate/cis-Aconitate_timingStats.svg",),
//     image("Figures/bmUnivariate/Citrate_timingStats.svg",),
//     image("Figures/bmUnivariate/Creatine phosphate_timingStats.svg",),
//     image("Figures/bmUnivariate/Creatine_timingStats.svg",),
//     image("Figures/bmUnivariate/Creatinine_timingStats.svg",),
//     image("Figures/bmUnivariate/Fumarate_timingStats.svg",),
//     image("Figures/bmUnivariate/Lactate_timingStats.svg",),
//     image("Figures/bmUnivariate/Pyruvate_timingStats.svg",),
//     image("Figures/bmUnivariate/Succinate_timingStats.svg",),
//   ),
//   caption: [
//     エネルギー関連代謝物の経時変化による母乳中代謝物濃度の比較。
//   ]
// )<fig-bmEnergy>

// #figure(
//   grid(
//     columns: 4,

//     image("Figures/bmUnivariate/Acetate_timingStats.svg",),
//     image("Figures/bmUnivariate/Butyrate_timingStats.svg",),
//     image("Figures/bmUnivariate/Caprate_timingStats.svg",),
//     image("Figures/bmUnivariate/Caprylate_timingStats.svg",),
//     image("Figures/bmUnivariate/Choline_timingStats.svg",),
//     image("Figures/bmUnivariate/Ethanolamine_timingStats.svg",),
//     image("Figures/bmUnivariate/Methanol_timingStats.svg",),
//     image("Figures/bmUnivariate/myo-Inositol_timingStats.svg",),
//     image("Figures/bmUnivariate/O-Phosphocholine_timingStats.svg",),
//     image("Figures/bmUnivariate/sn-Glycero-3-phosphocholine_timingStats.svg",),
//     image("Figures/bmUnivariate/Uridine_timingStats.svg",),
    

//   ),
//   caption: [
    // 脂肪酸及びその他代謝物の経時変化による母乳中代謝物濃度の比較。
//   ]
// )<fig-bmOther>

#figure(
  grid(
    columns: 5,

    [A],
    image("Figures/bmOPLSDA_secScore.svg",),
    h(1em),
    [B],
    image("Figures/bmOPLSDA_secLoading.svg",),

  ),
  caption: [
    分泌型（Se+）および非分泌型（Se-）に基づく母乳中メタボロームの OPLS-DA 解析
  ]
)<fig-bmOPLSDA>
A: スコアプロット。Se+（青色）は2'-FL分泌型個体、Se-（橙色）は2'-FL非分泌型個体を示す。B: ローディングプロット。図中点の色は、VIPの値により色分けされている。（R2Y: 0.678, Q2: 0.606）

#pagebreak()
#figure(
  // table(
  //   columns: 4,
  //   fill: none,
  //   stroke: none,
  //   inset: 5pt,
  grid(columns: 2,
    image("Figures/bmUnivariate/2'-fucosyllactose_timingSec_secStats.svg",),
    image("Figures/bmUnivariate/3-fucosyllactose_timingSec_secStats.svg",),
    image("Figures/bmUnivariate/Fucose_timingSec_secStats.svg",),
  ),

  caption: [
    母体の分泌型/非分泌型間で有意な濃度差を示した母乳中代謝物
  ],
)<fig-bmSecConc>
Se+は2'-FL分泌型個体、Se-は2'-FL非分泌型個体を示す。

#pagebreak()
#figure(
  image(
    "Figures/cSx.svg",
  ),
  caption: [
  母児糞便サンプルの代表的な #super[1]H-NMR スペクトル
]
)<fig-feSpec>
図中の番号は同定された一部の代謝物を示す。1, Lactate; 2, 3-Fucosyllactose; 3, 2'-Fucosyllactose; 4, Acetate; 5, Succinate; 6, 3'-Sialyllactose; 7, Galactose; 8, Glucose; 9, Lactose; 10, _myo_-Inositol; 11, Lactulose; 12, Fumarate; 13, Tyrosine; 14, Phenylalanine; 15, Formate

#figure(
  grid(
    columns: 5,

    [A],
    image("Figures/fePCAc_Score.svg",),
    h(1em),
    [B],
    image("Figures/fePCAc_Loading.svg",),
    [C],
    image("Figures/fePCAm_Score.svg",),
    h(1em),
    [D],
    image("Figures/fePCAm_Loading.svg",),
  ),
  caption: [
    母児糞便中メタボロームの産後時期別主成分分析（PCA）
  ]
)<fig-fePCA>
A, C: スコアプロット（A: 乳児、C: 母親）。スコアプロットは時期により色分けされている。b, 出産前24週; c, 出産直後; d, 生後1ヶ月; e, 生後4-5ヶ月；f, 生後8ヶ月；g, 生後1年半；h, 生後3年；k, 生後5年。B, D: ローディングプロット。

#figure(
  grid(
    columns: 5,

    [A],
    image("Figures/feOPLSc_TimeCourseScore.svg",),
    h(1em),
    [B],
    image("Figures/feOPLSc_TimeCourseSLine_add.svg",),
    [C],
    image("Figures/feOPLSm_TimeCourseScore.svg",),
    h(1em),
    [D],
    image("Figures/feOPLSm_TimeCourseSLine_add.svg",),
  ),
  caption: [
    母児糞便中メタボロームの経時的変化に関する OPLS-R 回帰分析
  ]
)<fig-feOPLSR>
A, C: スコアプロット（A: 乳児（$R^2Y=0.907$, $Q^2=0.866$）, C: 母親（$R^2Y=0.396$, $Q^2=0.118$））。スコアプロットは時期により色分けされている（b, 出産前24週; c, 出産直後; d, 生後1ヶ月; e, 生後4-5ヶ月；f, 生後8ヶ月；g, 生後1年半；h, 生後3年；k, 生後5年）。B, D: S-lineプロット（B: 乳児, D: 母親）。横軸は#super[1]H-NMRのケミカルシフトである。縦軸はビン積分値の変動量を示し、ピーク強度が大きいほど絶対値は大きくなる。色分けはグループ間スコアとの相関係数を示し、高いほど群分けに寄与することを示す。

#figure(
  grid(
    columns: 5,

    [A],
    image("Figures/feOPLSc_sec1Score.svg",),
    h(1em),
    [B],
    image("Figures/feOPLSc_sec1SLine_add.svg",),
    [C],
    image("Figures/feOPLSc_sec2Score.svg",),
    h(1em),
    [D],
    image("Figures/feOPLSc_sec2SLine_add.svg",),
    [E],
    image("Figures/feOPLSc_sec3Score.svg",),
    h(1em),
    [F],
    image("Figures/feOPLSc_sec3SLine_add.svg",),
  ),
  caption: [
    母体の分泌型（Se+/Se-）が乳児糞便メタボロームに及ぼす影響に関する OPLS-DA 判別解析
  ]
)<fig-feOPLSDA>
A, C, E: スコアプロット（Se+ vs Se-）。A: 出産直後（$R^2Y=0.701$, $Q^2=0.332$）、C: 産後1ヶ月（$R^2Y=0.882$, $Q^2=0.37$）、E: 産後4-5ヶ月（$R^2Y=0.747$, $Q^2=-0.107$）。
B, D, F: S-lineプロット。上方向のピークが Se- 群、下方向のピークが Se+ 群に特徴的な代謝物を示す。B: 出産直後、D: 産後1ヶ月、F: 産後4-5ヶ月。

= 謝辞
#set par(first-line-indent: 
  (amount: 1em, all: true) 
)
本研究を遂行するにあたり、終始熱心かつ丁寧なご指導を賜りました北海道大学大学院先端生命科学研究院 蛋白質科学研究室の相沢智康教授、ならびに新井達也助教に深く感謝申し上げます。また、副査として論文をご精読いただき、学術的な観点から貴重なご助言を賜りました同研究院 自然免疫研究室の中村公則教授、ならびに生物情報解析科学研究室の菊川峰志准教授に心より御礼申し上げます。

NMR測定において多大なるご支援をいただきました久米田博之博士、熊木康裕博士、大西裕季博士に厚く御礼申し上げます。また、解析手法の確立や考察において有益なご示唆をいただきました森永乳業株式会社の和泉裕久様、田畑風華様に深く感謝の意を表します。

本研究の基盤となる岩見沢市母児健康調査（SMILE Iwamizawa）において、研究デザインの構築や試料提供のご調整に多大なるご尽力をいただきました、北海道大学大学院医学研究院 社会医学分野公衆衛生学教室の玉越暁子教授をはじめとする研究グループの皆様に厚く御礼申し上げます。何より、本調査の趣旨をご理解いただき、貴重な試料をご提供くださいました岩見沢市の参加者の皆様に、深く感謝申し上げます。

最後に、日々の研究生活において有益な議論と刺激をいただいた蛋白質科学研究室の皆様、ならびに研究室運営や事務手続きにおいて多大なるご支援をいただきました技術補佐員の大貫しのぶ様に、心より感謝申し上げます。
