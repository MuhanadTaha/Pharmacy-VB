
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1bce2c5f-6e0d-4f26-9707-0b970d250161', N'Admin', N'ADMIN', N'6e0d95a8-8287-4d87-9b3d-6f1a6c4ecb4c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [State], [StreetAddress]) VALUES (N'320dc0d8-0c1e-4c69-afee-98a0fda40958', N'muhannadtaha.author@gmail.com', N'MUHANNADTAHA.AUTHOR@GMAIL.COM', N'muhannadtaha.author@gmail.com', N'MUHANNADTAHA.AUTHOR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIBrMUUQrK0TTDotToc/MrJsAuQw6Zs3SXpOCwwfYDxMNMm9/nJ3saZZz/UQztohAA==', N'PFSZHX6KFYC4MJPUYRFYCCY5VNYZABWJ', N'1a196572-3fc0-401e-b319-0186a723b706', N'0597502308', 0, 0, NULL, 1, 0, N'Ramallah', N'ApplicationUser', N'Muhanad Taha', N'Select one', N'Ramallah')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [State], [StreetAddress]) VALUES (N'4b6eaf39-45e8-4799-b979-e3e91008a90a', N'yousef-0597@hotmail.com', N'YOUSEF-0597@HOTMAIL.COM', N'yousef-0597@hotmail.com', N'YOUSEF-0597@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEI4K9GvyGNqD3DFShz8Bc1cehea12uvFN5XOoWp1YN1ut9oL9OeiYf+4cozYjjmFeg==', N'QMM2JNGZDRZWMLRVID5SUEOHDBII325L', N'a267764f-d796-43f4-8946-995925e4750a', NULL, 0, 0, NULL, 1, 0, N'رام الله والبيرة', N'ApplicationUser', N'Yousef', N'Palestine', N'قراوة بني زيد، رام الله')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'320dc0d8-0c1e-4c69-afee-98a0fda40958', N'1bce2c5f-6e0d-4f26-9707-0b970d250161')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b6eaf39-45e8-4799-b979-e3e91008a90a', N'1bce2c5f-6e0d-4f26-9707-0b970d250161')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230404215053_jjj', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230405103045_first', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230405104541_appuser', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230405105214_appuser1', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230405174650_ss', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230406192502_repo', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230406192605_reports', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230406202753_reportst', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230406210336_reportstcor', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230407213803_rem', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230414145434_last', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [Title], [Date], [Description], [Image]) VALUES (24, N'فندق قصر الحمراء', CAST(N'2023-04-11T22:34:15.8269498' AS DateTime2), N'هو باكورة أعمال الشركة ، معلم تاريخي من معالم رام الله بني عام ١٩٢٦ سكنا خاصا لعائلة الباتح إحدى عائلات رام الله العريقة؛ استأجرته شركة مصايف رام الله عام ١٩٤٥ وحولته الى فندق ومنتجع سياحي ، استضاف هذا الفندق شخصيات مهمة منها جلالة الملك عبد الله ملك الأردن وسمو الأمير نايف ورجال البلاط الملكي ورئيس الوزراء والوزراء وعدد من امراء الكويت وكذلك العديد من كبار الشخصيات السياسية والثقافية والفنية في أواخر الثمنينات وبعد أن توقفت أعمال السياحة والاصطياف، نتيجة الاوضاع السيئة التي سادت المنطقة في تلك الفترة ، قامت الشركة بتأجيره الى جامعة بيرزيت ، سكناً لطالبات الجامعة . بتاريخ ٢٠٠٧/٦/٢٦ استعادت الشركة مبنى قصر الحمراء من الجامعة، وقامت بترميمه وتحديثه بشكل يضمن المحافظة على المبنى', N'\assets\img\Projects\133257188558235381.jfif')
INSERT [dbo].[Projects] ([Id], [Title], [Date], [Description], [Image]) VALUES (26, N'مجمع دنيا التجاري', CAST(N'2023-04-11T23:38:54.7488616' AS DateTime2), N'بتاريخ ۲۰۰۷/۷/۱ بدأت الشركة في بناء مجمع دنيا التجاري على موقع سينما دنيا سابقا ، بالشارع الرئيسي برام الله ، وذلك أن انتهت أعمال الحفريات في الموقع وبعد اعداد كل ما يلزم من الترتيبات والتجهيزات الضرورية للمباشرة في العمل . بعد يتكون هذا البناء من ١٢ طابق ثلاث طوابق منها تحت مستوى الشارع الرئيسي ، اعدت لمواقف السيارات . وتسع طوابق فوق مستوى الشارع الرئيسي الثلاث الطوابق الأولى محلات ومعارض تجارية عددها ٢٥ محلا ومعرضا وأربع طوابق تم تقسيمها الى مكاتب بمساحات واسعة مختلفة .



لقد تم تخصيص الرووف الأول الطابق الثامن) مطعماً حديثاً فخماً تتسع قاعته لما يقرب من ۳۳٠ شخص





ان البناية الآن في دور التشطيب ومن المنتظر أن ينتهي العمل فيها في نهاية صيف هذا العام ٢٠١٠.ان البناية الآن في دور التشطيب ومن المنتظر أن ينتهي العمل فيها في نهاية صيف هذا العام ٢٠١٠.



بلغت التكاليف المدفوعة لأعمال البناء منذ بدايتها وحتى تاريه ۲۰۱۰/۳/۳۱ مبلغ ٢,١٣٤,٠٣٧ دينار أردني ، ويمثل هذا المبلغ ٨٠٪ من مجمل تكاليف البناء حسب نـ تقديرات الادارة والطاقم الهندسي المشرف .بلغت التكاليف المدفوعة لأعمال البناء منذ بدايتها وحتى تاريخ ۲۰۱۰/۳/۳۱ مبلغ ٢,١٣٤,٠٣٧ دينار أردني ، ويمثل هذا المبلغ ٨٠٪ من مجمل تكاليف البناء حسب نـ تقديرات الادارة والطاقم الهندسي المشرف .', N'\assets\img\Projects\133257227347464804.jpg')
INSERT [dbo].[Projects] ([Id], [Title], [Date], [Description], [Image]) VALUES (27, N'فندق مونت سكوبس', CAST(N'2023-04-12T00:03:39.2767914' AS DateTime2), N'يقع في حي الشيخ جراح على مرتفع مشرف يطل على المنظر الرائع لمدينة القدس شرقها وغربها . قامت الشركة ببنائه وتجهيزه عام ١٩٦٤، يحتوي على ٦٥ غرفة مزدوجة . بني على أحدث طراز وحسب المواصفات الحديثة للفنادق العالمية . حصل على أعلى درجة للفنادق السياحية (خمس نجوم)، والفندق يعتبر مفخرة الصناعة الفندقية في القدس العربية حتى يومنا هذا .
تقوم الشركة من فترة الى أخرى بإجراء التجديدات اللازمة وتحديث الفندق بشكل يواكب التطور السياحي ويجاري المستوى الفندقي العالمي. تحرص الادارة بإعطائه دائماً أعلى درجة من الصيانة للمحافظة عليه واظهاره بأحسن وجه وبشكل يضمن لنزلائه الاقامة المريحة والخدمة الممتازة', N'\assets\img\Projects\133257242192755265.jpg')
INSERT [dbo].[Projects] ([Id], [Title], [Date], [Description], [Image]) VALUES (28, N'سينما الحمراء', CAST(N'2023-04-12T00:09:19.2973517' AS DateTime2), N'إن أول مشروع للشركة في القدس هو مشروع سينما الحمراء كان ذلك في عام ١٩٥٣ ، حيث قامت الشركة ببناء سينما الحمراء في شارع صلاح الدين ، بعد ان أسست شركة عادية تابعة لها حصة الشركة فيها كانت بناية سينما الحمراء مفخرة دور السينما في المملكة في تلك الفترة ، حيث تجلى فيها فن الهندسة المعمارية بالاضافة الى قاعتها الواسعة الفخمة ومسرحها الكبير المميز كانت دار سينما الحمراء المركز المفضل للندوات الثقافية والمؤتمرات المختلفة التي كانت تقام في مدينة القدس العربية ، وكان لمسرحها الأثر الكبير في تشجيع المسرحيات الفنية والتمثيليات الاجتماعية الهادفة.

أغلقت السينما أبوابها في أواخر الثمنينات ، مع حلول الانتفاضة الأولى ونتيجة لحالة عدم الاستقرار التي سيطرت على المدينة والتي تزامنت مع انتشار أجهزة التلفزيون في البيوت ومع فرض الضرائب الباهظة على المباني . ظلت السينما مغلقة حتى عام ٢٠٠٧ ، حيث قامت الشركة بتأجير هي الى شركة القدس للاستثمار وشريكها منير قرط لمدة خمسة عشر اتفاقية خاصة على أن يقوم المستأجر على نفقته بعمل كل ما يلزم من ترميمات و اصلاحات وانشاءات لاعدادها قاعة متعددة الأغراض بموجب الاتفاقية المشار اليها . وقد تم تنفيذ الاتفاقية وقام المستأجر بأعمال الترميم وأعدها قاعة حديثة فخمة وأسماها البناية كما عاماً بموجب " قصر الحمراء" .', N'\assets\img\Projects\133257247509183901.jpg')
INSERT [dbo].[Projects] ([Id], [Title], [Date], [Description], [Image]) VALUES (29, N'بناية الشركة (عمارة الأريزونا)', CAST(N'2023-04-12T00:15:55.9354176' AS DateTime2), N'قامت الشركة ببنائها عام ١٩٥٤ وخصصت القسم الأمامي منها لمقهى حديث للمشروبات الساخنة وللبوظة والمرطبات والحلويات الافرنجية ؛ وقد جهز هذا المقهى آنذاك بأفخم الأثاث وأحدث الماكينات واللوازم الخاصة لذلك. وفيما بعد تم تحويل المقهى الى مطعم وقد سمي بمطعم الكروان . وكان في تلك الفترة أرقى المطاعم وأوسعها شهرة. مساحة العمارة ۱۹۰۰ متر مربع مؤلفة . من ٦ محلات تجارية و ۱۷ مكتب . القسم الأمامي مؤجر حالياً الى جوال وباقي المحلات والمكاتب مؤجرة جميعها', N'\assets\img\Projects\133257250017042992.jpg')
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
