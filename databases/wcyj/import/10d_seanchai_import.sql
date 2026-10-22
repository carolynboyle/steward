-- ==========================================================================
-- 10d_seanchai_import.sql — one-time import of seanchaí research ledger data
-- Generated: 2026-10-22
-- 102 records · 12 searches · 23 todos
-- ADDITIVE: wraps in a transaction; ON_ERROR_STOP=1 required
-- ==========================================================================

BEGIN;

-- --------------------------------------------------------------------------
-- Records (102)
-- --------------------------------------------------------------------------

-- PR-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    1,
    '1841',
    'Mortgage',
    'Washington County',
    'PA',
    'Washington Mortgages 1841–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QHV-V38P-N9ZB-Q?view=fullText&keywords=Connell+Boyle%2CPennsylvania&searchForm=advanced&lang=en',
    'Connell Boyle and John Boyles jointly mortgage property to Isaac Lightner for $2,747. Title chain: Dobbs→Davis→Boyles (~50 acres + Columbia town lots). Document also contains a separate Devore mortgage for Lots 141–142 in Monongahela City. OCR: ''Connel Boyles'' throughout — likely Connell Boyle. ''Bollman Sex'' mid-page — probable OCR corruption of section heading.

DATES: Transaction: 31 Mar 1841; Acknowledged: 12 Jul 1861; Cites: 14 Oct 1836 (Dobbs→Davis); 30 Jul 1841 (Devore mortgage)

NAMES: Connell Boyle; John Boyles; Samuel Davis; Elizabeth Davis; John Dobbs; Mary Dobbs; Isaac Lightner; Samuel Devore; Charles Bollman (dec.); James Mann; Alfred Thirkield (wit.); John Doyle (wit.); John Clement (JP)

LOCATIONS: Washington County PA; Columbia (town); Monongahela City; Monongahela River

CITED RECORDS: Book I No. 2 pp. 379–380 (Boyle deed); Book I Vol. 2 pp. 355–357 (Dobbs→Davis); Book I No. 2 pp. 189–190 (Devore/Mann lot 141); Book I No. 2 p. 1788 (Mann→Devore lot 142); Patent to Joseph Parkinson 31 May 1796, PA Rolls Book 28 p. 294'
);

-- PR-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    2,
    '1855',
    'Deed',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZNR?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CFayette&searchForm=advanced&lang=en',
    'John Boyle, Connell Boyle, and Rebecca A. Boyle (Connell''s wife) sell a Carroll Township tract bordering the Monongahela River to James O. Hard for $2,000. Tract is part of land conveyed to Connell and John Boyle by Samuel Davis (1833, same as PR-001). A ~2-acre lot held by H. Myers & Co. is excepted. Document also contains an unrelated deed: Hannah Randolph to Phebe Coben for half lot No. 52 in West Brownsville for $600. OCR: ''river boningately'' and ''ever mongaliel'' = Monongahela River; ''James O Hara'' / ''James O Ham'' = James O. Hard; ''peraises'' = perches.

DATES: Transaction: 20 Feb 1855; Cites: 30 May 1833 (Davis→Boyle); 13 May 1854 (Boyle→Moorhead); 24 Mar 1853 (Coburn→Randolph, unrelated); 9 Apr 1855 (Randolph acknowledgment, unrelated)

NAMES: John Boyle (grantor); Connell Boyle (grantor); Rebecca A. Boyle (Connell''s wife, grantor); James O. Hard (grantee, City of Allegheny); Samuel Davis and wife (prior grantors, 1833); James K. Moorhead (prior grantee, 1854); H. Myers & Co. (hold excepted ~2-acre lot). Unrelated deed: Hannah Randolph; Phebe Coben; James Coburn; Charity Coburn; R.V. Jones (wit.); Wm. C. Fishburn (JP)

LOCATIONS: Carroll Township, Washington County PA; Monongahela River (low water mark); City of Allegheny PA; West Brownsville (unrelated deed)

CITED RECORDS: Samuel Davis→Boyle deed 30 May 1833, Deed Book 2 Oct 2d p. 379 (also in PR-001); Boyle→Moorhead deed 13 May 1854, Washington Co. Book N. 3d p. 339; Coburn→Randolph deed 24 Mar 1853, Book L. Vol. 3 pp. 376–377 (unrelated)'
);

-- PR-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    3,
    '1855',
    'Deed (continuation of PR-002)',
    'Allegheny County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZ64?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania&searchForm=advanced&lang=en',
    'Continuation of PR-002 deed. Warranty clause confirms John and Connell Boyle hold clear title excepting H. Myers & Co. lot. John Boyle acknowledged before Pittsburgh Alderman Buckmaster on 20 Feb 1855 — places John in Allegheny County at that date. Connell and Rebecca A. Boyle acknowledged before JP Ira R. Buller in Washington County on 5 Mar 1855; Rebecca examined separately per standard married-women''s procedure. Also contains unrelated Duvall→Spriggs deed for lot in Borough of Washington for $1,600. OCR: ''James O Hara'' / ''James O Have'' = James O. Hard; ''Ira R. Butter'' = Ira R. Buller; ''Myers F.C.'' = H. Myers & Co.; ''William B. Buller'' likely OCR confusion of witness names.

DATES: John Boyle acknowledgment: 20 Feb 1855, Pittsburgh; Connell & Rebecca A. Boyle acknowledgment: 5 Mar 1855, Washington County; Recorded: 12 Apr 1855. Unrelated deed: 12 Apr 1855 (Duvall→Spriggs)

NAMES: John Boyle (grantor; acknowledged in Pittsburgh); Connell Boyle (grantor); Rebecca A. Boyle (grantor, examined separately); James O. Hard (grantee); William Bonswell (wit. to John Boyle); William N. Howard (wit.); Ira R. Buller (JP, Washington County); Buckmaster (Alderman, Pittsburgh); Cyrus Underwood (Recorder). Unrelated deed: William Duvall; Hester Duvall; Joseph M. Spriggs; Mary Ann Shrives; James Spriggs (dec.); Thomas Good (dec.); Joseph Henderson (executor); Robert P. Lane; J.L. Judson (wit.)

LOCATIONS: Pittsburgh, Allegheny County PA (John Boyle acknowledgment); Washington County PA (Connell & Rebecca acknowledgment); Borough of Washington PA (unrelated deed — lot on Main Street and Pine Alley)

CITED RECORDS: Continuation of PR-002; same underlying deed. Unrelated: Orphans Court sale of Thomas Good estate; Henderson→Spriggs deed; Duvall–Spriggs contract 25 Jan 1854'
);

-- PR-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    4,
    '1854',
    'Trust agreement / deed',
    'Washington County',
    'PA',
    'Washington. Deeds 1857–1858; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-SS21?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'Trust agreement: J. Kennedy Moorhead acknowledges he holds an undivided half of described lands in trust for John and Connell Boyle, who hold the other half as tenants in common. Boyles paid $2,500 (half of purchase price) plus $1,500 (half of first installment) = $4,000 their share to date, with remaining installments still due. Lands include coal rights. Property chain includes Samuel Davis→Boyle conveyances (see PR-001, PR-002), plus two 13 May 1854 deeds from Sampson and Robe. Establishes Moorhead as business partner, not merely a buyer. OCR: ''1875'' in acknowledgment = almost certainly ''1857''; ''I Kennedy Moorhead'' = J. Kennedy Moorhead; ''morety'' = moiety (legal term for half-share); ''do signed sealed and Delinday'' = OCR corruption of ''signed, sealed and delivered.''

DATES: Deeds cited: 13 May 1854 (Sampson→Boyle; Robe→Boyle); Acknowledgment: 12 Jul 1857 (OCR reads 1875 — inconsistent with 1857 recording; almost certainly OCR error); Recorded: 28 Nov 1857

NAMES: J. Kennedy Moorhead (party of first part; holds undivided half in trust for Boyles; also witness as J.K. Moorhead); John Boyle (party of second part); Connell Boyle (party of second part); James Sampson (prior grantor); Mary Sampson (prior grantor); David Gardiner Robe (prior grantor); Samuel Davis and wife (prior grantors); N. Buckmaster (witness); A. Buckmaster (Alderman, Pittsburgh; took acknowledgment); Ira Butler Esqr. (adjacent landowner — possibly same as Ira R. Buller, JP, from PR-003)

LOCATIONS: Washington County PA (lands); Pittsburgh, Allegheny County PA (acknowledgment)

CITED RECORDS: Samuel Davis→Boyle deed (same chain as PR-001, PR-002); James Sampson & Mary Sampson→Boyle deed 13 May 1854; David Gardiner Robe→Boyle deed 13 May 1854; mortgage bearing same date as deed (not separately identified)'
);

-- PR-005
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-005',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    5,
    '1853',
    'Deed (title chain)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9R4F?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania&searchForm=advanced&lang=en',
    '1864 deed conveying ~420 acres near Lock No. 4, Fallowfield, on the Monongahela River from McClean to Kerr & Gillespie, tracing title back to Connell Boyle and John Boyle. Explicitly states property was ''owned by Connell Boyle & John Boyle just prior to May 1853'' — first direct record link to Lock No. 4, matching the C & J Boyle boatyard location in AN-N. Property includes coal, limestone, and mineral rights plus a 28-acre river tract. Date inconsistency: document states Boyles conveyed land tract to Fitzsimmons 14 May 1833, but Davis→Boyle deed was 30 May 1833 — Boyles could not have conveyed land they had not yet acquired; 1853 almost certainly correct for both conveyances. Consideration to Kerr & Gillespie: $21,400 (OCR garbled as ''$200''). OCR: ''Connel Bodle'' = Connell Boyle; ''Jock No 4'' = Lock No. 4; ''James O Harra'' = James O. Hard (PR-002/003); ''four hundred deed twenty'' = 420 acres; ''inprovements'' = improvements.

DATES: Boyle→Fitzsimmons (coal): 14 May 1853; Boyle→Fitzsimmons (land): 14 May 1833 (see date inconsistency note); Fitzsimmons→Wallace: 28 Jun 1858; Baine→McClean: 13 Oct 1863; McClean→Kerr & Gillespie acknowledgment: 8 Jun 1864; Recorded: 25 Jun 1864. Unrelated: Taylor→Shannon, Carroll Twp., 18 Mar 1864

NAMES: Samuel McClean Jr. (grantor); Susannah McClean (grantor, wife); Patrick Kerr (grantee); James Gillespie (grantee); Connell Boyle and wife (prior grantors — wife unnamed); John Boyle (prior grantor); David Fitzsimmons (intermediate owner); John A. Fitzsimmons (intermediate owner); Wm. Wallace (dec., intermediate owner); Wm. P. Baine (administrator of Wallace estate); James O. Harra (adjacent landowner — likely James O. Hard from PR-002/PR-003); Thomas Frye (adjacent landowner); Abdel/Adel McClure (witness, Recorder & JP, Allegheny County); Alvin King (Recorder). Unrelated: Wm. Taylor; Catharine Taylor; Dulton Shannon

LOCATIONS: Lock No. 4, Fallowfield, Washington County PA; Monongahela River; Carroll Township (unrelated deed)

CITED RECORDS: Boyle→Fitzsimmons coal/mineral deed 14 May 1853, Deed Book Vol. 3d p. 219; Boyle→Fitzsimmons land deed 14 May 1833 (see date inconsistency in summary), Deed Book Vol. p. 17; Fitzsimmons→Wallace deed 28 Jun 1858; Baine (Wallace estate admin)→McClean deed 13 Oct 1863, Deed Book Vol. 4 p. 35; Orphans Court Allegheny County No. 42 Dec Term 1860; Orphans Court Washington County No. 23 May 1863'
);

-- PR-006
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-006',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    6,
    '1854',
    'Deed (two deeds)',
    'Washington County',
    'PA',
    'Washington. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-C9MX-W?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania&searchForm=advanced&lang=en',
    'Two deeds. (1) David Gardiner Robe→John and Connell Boyle: coal and mineral rights, Carroll Township, 119 acres 52 perches, for $1,000, 13 May 1854. This is the source deed cited in PR-004 and PR-005. (2) John and Connell Boyle→Judy Moorhead, Pittsburgh, for $20,042.40, 13 May 1854; property description cut off in transcript. ''Judy Moorhead'' is unusual — possibly OCR error for J.D. or J.K. Moorhead; cf. J. Kennedy Moorhead (PR-004). The $20,042.40 figure is OCR-uncertain and should be verified against the original image — it is an order of magnitude larger than typical Boyle transactions and likely an OCR assembly error. OCR: ''David Gardner Rake/Rope/Rabe'' = David Gardiner Robe; ''Ira B. Blitter'' = Ira R. Buller; ''Connell Boule'' = Connell Boyle; ''M. Leeple'' = M. Teeple; ''ones acres'' = 119 acres.

DATES: Robe→Boyle deed: 13 May 1854; recorded 15 May 1854. Boyle→Moorhead deed: 13 May 1854 (property description cut off)

NAMES: David Gardiner Robe (grantor — OCR: ''Rake'', ''Rope'', ''Rabe'', ''Gardener''; same person cited in PR-004 and PR-005); John Boyle (grantee in Robe deed; grantor in Moorhead deed); Connell Boyle (grantee in Robe deed; grantor in Moorhead deed); Judy Moorhead (grantee, Pittsburgh — possibly J.D. or J.K. Moorhead; see J. Kennedy Moorhead in PR-004); Ira R. Buller (JP — OCR: ''Ira B. Blitter'', ''Ira R. Butler''; same as PR-003, PR-004); M. Cullar (witness); F.C. Morrison (Recorder)

LOCATIONS: Carroll Township, Washington County PA; Pittsburgh PA (Judy Moorhead''s address)

CITED RECORDS: This is the source deed cited in PR-004 and PR-005 (Robe→Boyle 13 May 1854). Boyle→Moorhead deed: property description cut off in transcript.'
);

-- PR-007
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-007',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    7,
    '1854',
    'Mortgage / Power of attorney',
    'Washington County',
    'PA',
    'Washington. Mortgages 1841–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QHV-V38P-N98N-W?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CFayette&searchForm=advanced&lang=en',
    'James K. Moorhead mortgages to John Boyle and Connell Boyle (reversed from PR-006 direction). Boyles assign a portion to Sampson (three promissory notes) on 13 May 1854, then execute a power of attorney 26 May 1854 appointing Cooper Morrison to assign their remaining mortgage interest to Thomas Miller Esq. of Pittsburgh. Connell Boyle signed through attorney-in-fact John Coyle throughout — suggests Connell was absent or incapacitated at time of signing. Mortgage amount OCR-corrupted; fragments visible (''nine hundred,'' ''nineteen 1/100 dollars'') but no reliable total. Same-day transactions with PR-006 (13 May 1854) suggest a complex multi-part financial arrangement between Boyles and Moorhead. Unrelated: School Directors of Monongahela City District mortgage to F.G. and Susanna Huffman for $3,000. OCR: ''John Bogle'' / ''Connett Boyle'' / ''Connell Degle'' = Connell Boyle; ''John Comb'' / ''John Cogle'' = John Coyle; ''Minguhala City'' = Monongahela City; ''Somersell Yours County'' = Somerset County (Huffmans).

DATES: Moorhead mortgage acknowledgment: 13 May 1854; Boyle assignment to Sampson: 13 May 1854; Power of attorney (Boyle→Cooper Morrison to assign to Thomas Miller): 26 May 1854; Recorded: 28 May 1854 (POA). Unrelated: School Directors mortgage to Huffmans: 27 Dec 1850 (OCR uncertain)

NAMES: James K. Moorhead (mortgagor); John Boyle (mortgagee; grantor of POA); Connell Boyle (mortgagee; grantor of POA, signed by atty-in-fact John Coyle); John Coyle (attorney-in-fact for Connell Boyle); Cooper Morrison Esq. (appointed attorney to assign mortgage); Thomas Miller Esq. (assignee, City of Pittsburgh); Sampson [surname unknown] (earlier assignee of three promissory notes and mortgage portion); W. Lewis (Alderman, took POA acknowledgment); Archer [All?] (Alderman, took Moorhead acknowledgment); F.C. Morrison (Recorder). Unrelated: Cyrus Underwood, Joseph Alexander, Alexander Wilson, H.C. Finley, Alexander Scott, Jacob Cort (School Directors, Monongahela City District); F.G. Huffman and Susanna Huffman (mortgagees, $3,000)

LOCATIONS: Washington County PA; Pittsburgh PA (Thomas Miller); Allegheny County PA (acknowledgment); Monongahela City (unrelated school directors mortgage)

CITED RECORDS: Moorhead mortgage in favor of Boyles (this document); assignment to Thomas Miller referencing ''first payment as stated in mortgage 1854''; cf. PR-006 (same date, same parties, reversed direction)'
);

-- GV-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'GV-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'GV'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    8,
    '1863',
    'Orphans'' Court docket',
    'Washington County',
    'PA',
    'Allegheny. Court Dockets 1862–1863, 1860–1862; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-L991-835R?view=fullText&keywords=Connell+Boyle%2CPennsylvania&searchForm=advanced&lang=en',
    'Allegheny County Orphans'' Court proceedings for Thomas Wallace estate (No. 42, Dec Term 1860). Administrator W.P. Baum petitions to raise $18,000 from estate real property, as prior sales were insufficient to cover debts. Property described includes coal and minerals under the ''Romaina Farm'' near Lock No. 4, Monongahela River, Washington County, and a 28-acre river tract — same property as PR-005. Document explicitly recites Connell Boyle and John Boyle as prior owners ''just prior to May 1853'' and cites Boyle→Fitzsimmons deed of 14 May 1853, confirming 1853 (not 1833) and resolving the date discrepancy in PR-005. Court authorized sale; ground rent on Lot 21, Sidneyville sold to Thomas Pepperday for $375. Pittsburgh Second Street lot remained unsold through multiple pluries orders. OCR: ''Rock No 4'' = Lock No. 4; ''Connell Doyle'' = Connell Boyle; ''seven forterein'' = seven foot vein; ''eval limestone'' = coal limestone; ''Romaina Farm'' = possibly Romana Farm (farm name uncertain).

DATES: Orphans'' Court authorization to raise $18,000: 21 Mar 1863; Ground rent sale to Pepperday: 24 Jul 1863; Sale confirmed: 25 Jul 1863; 4th pluries order: 16 Apr 1864; 5th pluries order: 13 Aug 1864; Pittsburgh lot sale: 1 Oct 1864. Recites: Fitzsimmons→Wallace deed 28 Jun 1858; Boyle→Fitzsimmons deed 14 May 1853

NAMES: Thomas Wallace (dec.); William P. Baum (administrator de bonis non — OCR: ''Barn'', ''Bann''; same as Wm. P. Baine in PR-005); Connell Boyle (prior owner, recited); John Boyle (prior owner, recited); David Fitzsimmons (intermediate owner); John A. Fitzsimmons (intermediate owner); Dutton Shannon (prior coal owner — same as Dulton Shannon, PR-005 unrelated deed); Jeannette Shannon (Dutton''s wife); Thomas Pepperday (purchaser of ground rent); Matthew Bartholomew (prior grantee of Lot 21, Sidneyville); Sterrett P. J. (judge); Hamilton & Acheson (attorneys)

LOCATIONS: Washington County PA (Romaina Farm, Lock No. 4, Monongahela River); Allegheny County PA (court proceedings); Sidneyville / Borough of Birmingham (ground rent lot); Pittsburgh (Second Street lot)

CITED RECORDS: Fitzsimmons→Wallace deed 28 Jun 1858 (recited); Boyle→Fitzsimmons deed 14 May 1853 (recited — confirms 1853, resolves date discrepancy in PR-005); Shannon→Fitzsimmons deed 14 Aug 1853; Thomas Wallace→Matthew Bartholomew deed, Deed Book Vol. 81 App. 181; Orphans'' Court Allegheny County No. 42 Dec Term 1860 (original petition)'
);

-- PR-008
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-008',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    9,
    '1863',
    'Deed (estate sale)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9RLH?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'William P. Baine, administrator of Thomas Wallace estate, conveys Romania Farm and associated coal/mineral rights near Lock No. 4 to Samuel McClain for $7,500. This is the sale authorized by GV-001 court proceedings. Property description consistent with PR-005 and GV-001; Fallowfield Township explicitly named here. Receipt names grantee as ''Samuel Clark'' while deed names ''Samuel McClain'' — likely same person, OCR or clerical error. Date discrepancy: Fitzsimmons→Wallace deed cited as 28 Jun 1856 here vs. 1858 in GV-001 and PR-005 — verify against image. ''Romania Farm'' spelling consistent with GV-001 (vs. ''Romaina'' — likely same name). Document also contains unrelated petition for Monongahela City cemetery corporation. OCR: ''slavin Fitzsimmand'' / ''slavid Fitzsimmons'' = David Fitzsimmons; ''lock one &'' / ''seven No 4'' = Lock No. 4; ''comong held'' / ''honongahela'' = Monongahela; ''Thomas Day'' possibly = Thomas Fry (adjacent landowner, PR-005/GV-001); ''1885'' / ''1855'' for Boyle deed = 1853; ''1803'' for acknowledgment year = 1863.

DATES: Deed acknowledged: 4th day [month OCR-corrupted] 1863 (OCR reads ''1803'' — clearly wrong); Recorded: [Oct?] 20, 1863 (OCR: ''let 20 1867''). Recites: Boyle→Fitzsimmons 14 May 1853; Fitzsimmons→Wallace 28 Jun 1856 (discrepancy — see cited records)

NAMES: William P. Banne/Baum/Barn (administrator, Thomas Wallace estate — same person as PR-005, GV-001); Samuel McClain (grantee — receipt names him ''Samuel Clark''; same person, OCR or clerical inconsistency); Connell Boyle and wife (prior owners, recited); John Boyle (prior owner, recited); David Fitzsimmons and wife (intermediate owners, recited); John A. Fitzsimmons (intermediate owner, recited); Thomas Wallace (dec., intermediate owner); A.S. Nicholson (witness and Alderman, Pittsburgh); W.S. Nicholson (witness); M.H. How (Recorder). Unrelated: Monongahela City cemetery corporation petition signatories (J.R. Hazzard, James Williams, Joseph Wilson, James Sampson et al.)

LOCATIONS: Fallowfield Township, Washington County PA; Romania Farm, Lock No. 4, Monongahela River; Pittsburgh PA (acknowledgment)

CITED RECORDS: Shannon→Fitzsimmons deed 14 Aug 1853, Deed Book N 3rd p. 269; Boyle→Fitzsimmons coal deed 14 May 1853, Book Vol. 3 p. 519 (cf. PR-005: p. 219 — OCR discrepancy); Fitzsimmons→Wallace deed 28 Jun 1856 (OCR — GV-001 and PR-005 give 1858; date uncertain, verify against image); see GV-001 for authorizing court proceedings'
);

-- PR-009
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-009',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    10,
    '1853',
    'Grantee deed index',
    'Washington County',
    'PA',
    'Washington. Grantee Deed Indexes 1781–1924; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSN2-XQTX?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'Grantee index entries for John A. Fitzsimmons as recipient from Connell Boyle et al. Confirms three separate Boyle→Fitzsimmons transactions in Fallowfield Township, May 1853: two deeds (Vol. 3 L pp. 519, 522) and one agreement (Vol. 3 L p.517). Provides exact book/page references and recording dates. Note: execution date in deeds cited as 14 May 1853; recording dates are 16 and 19 May 1853. FamilySearch AI summary missed these entries entirely and described an unrelated Fetherling record instead.

DATES: Recorded: 16 May 1853 (Vol. 3 L p.519); 19 May 1853 (Vol. 3 L p.522 and p.517)

NAMES: John A. Fitzsimmons (grantee, all three entries); Connell Boyle et al. (grantor, all three entries — ''al'' = John Boyle)

LOCATIONS: Fallowfield Township, Washington County PA

CITED RECORDS: Three Boyle→Fitzsimmons entries: (1) Vol. 3 L p.519, rec. 16 May 1853; (2) Vol. 3 L p.522, rec. 19 May 1853; (3) Vol. 3 L p.517, rec. 19 May 1853 (Agreement). Cross-references PR-005, PR-006, PR-008, GV-001.'
);

-- PR-010
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-010',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    11,
    '1841',
    'Grantor deed index entry',
    'Washington County',
    'PA',
    'Washington. Grantor Deed Indexes 1781–1924; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSQQ-K3QS-C?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'Single index entry: Elizabeth Davis et al. conveyed to Connell Boyle et al., recorded 2 Aug 1841, Vol. 2 p. 529, Carroll Township. This is the Davis→Boyle conveyance cited throughout PR-001 through PR-005. Recording reference (Vol. 2 p. 529) differs from PR-001 citation (Book I No. 2 pp. 379–380) — verify whether same deed or separate transaction. FamilySearch AI summary missed this entry entirely and described unrelated 1889 Davis family transactions.

DATES: Recorded: 2 Aug 1841

NAMES: Elizabeth Davis (grantor — ''al'' suggests Samuel Davis also party); Connell Boyle et al. (grantee — ''al'' likely includes John Boyle)

LOCATIONS: Carroll Township, Washington County PA

CITED RECORDS: Relates to Davis→Boyle conveyance cited in PR-001 (Book I No. 2 pp. 379–380) and PR-002 (30 May 1833 deed, Book 2 p. 379). Recording reference here: Vol. 2 p. 529 — discrepancy with PR-001 citation; may be same deed, OCR variation, or separate conveyance.'
);

-- PR-011
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-011',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    12,
    '1834',
    'Grantor deed index entry (Patent Right)',
    'Washington County',
    'PA',
    'Washington. Grantor Deed Indexes 1781–1924; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSXB-L7QC-V?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'Index entry: Daniel Toomey, by attorney D.H., conveyed a Patent Right to Connell Boyle, recorded 24 Mar 1834, Vol. 2 R p. 49. ''Patent Right'' denotes transfer of the original Commonwealth land patent — the root of title. Dated 1834, this predates the Davis→Boyle conveyances in PR-001/PR-002/PR-010 (1841) and may represent the foundational title claim for the Carroll Township / Monongahela River land. John Boyle not mentioned — conveyance to Connell alone. FamilySearch AI summary missed this entry entirely.

DATES: Recorded: 24 Mar 1834

NAMES: Daniel Toomey (grantor, acting by attorney D.H.); Connell Boyle (grantee)

LOCATIONS: Washington County PA (Patent Right — type of interest, not a place name; denotes transfer of original Commonwealth land patent)

CITED RECORDS: Predates Davis→Boyle conveyances (PR-001, PR-002, PR-010); may represent original root of title for Carroll Township land. Vol. 2 R p. 49.'
);

-- PR-012
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-012',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    12,
    '1855',
    'Deed (warranty) — continuation of PR-002; + unrelated deed',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZ64?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Warranty/signature page of the same Boyle→O''Hara deed as PR-002 (Carroll Township land, $2,000). New information: warranty clause excepts ''the small Lot of Myers F.C.'' (Myers & Co. in PR-002). John Boyle acknowledged before Alderman Buckmaster in Pittsburgh 20 Feb 1855; Connell and Rebecca acknowledged before J.P. Ira R. Butler in Washington County 5 Mar 1855. Rebecca Boyle examined ''separate and apart from her said husband'' per dower-release procedure; she confirmed voluntary execution. Recorded 12 Apr 1855 by Cyrus Underwood. Second deed on same pages: Duvall quitclaim to Spriggs heirs for lot at Main St/Pine Alley, Borough of Washington, $1,600 (unrelated). OCR: ''James O’Hard'' / ''James O Have'' = James O''Hara; ''Ira R. Butter'' = Ira R. Butler; ''Mary Ann Shrives'' = Mary Ann Spriggs (heirs); ''William Dewall'' = William Duvall.

DATES: Boyle deed acknowledged: John Boyle 20 Feb 1855 (Pittsburgh); Connell & Rebecca Boyle 5 Mar 1855 (Washington Co.); Recorded: 12 Apr 1855. Duvall→Spriggs deed: 12 Apr 1855; Duvall→Spriggs contract: 25 Jan 1854.

NAMES: John Boyle (grantor); Connell Boyle (grantor); Rebecca A. Boyle (Connell''s wife, grantor); James O''Hara (grantee — OCR: ''O’Hard'', ''O Have''). Witnesses/officials Boyle deed: William Bonswell (wit., John Boyle); William N. Howard (wit., both Boyles); Ira R. Butler (wit. and J.P., Connell & Rebecca); Buckmaster (Alderman, Pittsburgh, John Boyle acknowledgment); Cyrus Underwood (Recorder). Duvall deed: William Duvall (grantor); Hester Duvall (wife, grantor); Joseph M. Spriggs & Mary Ann Shrives/Spriggs (grantees, heirs at law of James Spriggs Esq., dec.); Robert P. Lane (prior co-purchaser at Orphans Court sale); Joseph Henderson (executor, Thomas Good estate); J.L. Judson (witness).

LOCATIONS: Carroll Township, Washington County PA (Boyle deed); Borough of Washington, Washington County PA — Main Street & Pine Alley, Lot fronting 20 ft on Main St, 150 ft along Pine Alley (Duvall deed); City of Pittsburgh, Allegheny County PA (John Boyle acknowledgment)

CITED RECORDS: Same deed as PR-002 (Boyle→O''Hara, Carroll Twp, $2,000). Duvall deed cites: Henderson executor→Lane & Spriggs (Orphans Court sale, Washington Co.); Spriggs→Duvall contract 25 Jan 1854.

BATCH: SRCH-002'
);

-- PR-013
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-013',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    13,
    '1857',
    'Deed (quitclaim, nominal consideration) + unrelated deed',
    'Washington County',
    'OH',
    'Washington. Deeds 1857–1858; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-S3FG?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'John Boyle of Fallowfield Township quitclaims his interest in a 100-acre Carroll Township parcel to Connell Boyle of Carroll Township for $1 nominal consideration. Land was acquired by C. & J. Boyle from James Chara/O’Chara and wife Eliza on 10 Mar 1855 (two weeks after Boyles sold the riverside Carroll Twp. tract to O’Hara, suggesting active trading rather than liquidation). Neighbors: heirs of George Grant dec., William Wicherham, James Sampson. Nominal $1 consideration is standard for partnership dissolution or intra-family transfers settling accounts. John Boyle now of Fallowfield Twp. (previously Carroll Twp. in earlier records) — possible residence change or different part of his operations. Ira R. Butler again as both witness and J.P. (same Butler as PR-012/PR-002). OCR issues: opening clause reads ''John Cox Connel Boyle'' — the ⎬ bracket is a deed-book marginal indexing mark; grantor signed and acknowledged only as ''John Boyle.'' ''James Chara'' = possibly James O’Chara or other name; verify against image. Second unrelated deed on same pages: Ackerson inheritance/conveyance for Mount Pleasant Twp. land.

DATES: Boyle deed executed: 7 Mar 1857; Recorded: 19 May 1857. Unrelated Ackerson deed: 14 Apr 1857.

NAMES: John Boyle (grantor, of Fallowfield Twp. — OCR/transcript renders opening clause as ''John Cox Connel Boyle''; signed and acknowledged as John Boyle); Connell Boyle (grantee, of Carroll Twp.); James Chara/O’Chara and Eliza his wife (prior grantors to C. & J. Boyle, 10 Mar 1855 — name uncertain, OCR). Witnesses/officials: Ira R. Butler (witness and J.P.); Daniel O.C. Lambert (witness); Cyrus Underwood (Recorder). Unrelated deed: Reynolds S. Ackerson (grantor, Mahoning Co. OH); Margaret B. Ackerson his wife; Mathew R. Ackerson Jr. (grantee, Washington Co. PA); James Scroggs (testator); Margaret R. Scroggs (legatee, later Margaret R. Ackerson); Thomas Becker & James McClaskey (witnesses).

LOCATIONS: Carroll Township, Washington County PA (Boyle deed — 100 acres, 100 rods; adjoining heirs of George Grant dec., William Wicherham, James Sampson et al.); Fallowfield Township, Washington County PA (John Boyle’s residence at time of deed); Mount Pleasant Township, Washington County PA (unrelated Ackerson deed); Mahoning County OH (Reynolds Ackerson’s residence)

CITED RECORDS: C. & J. Boyle acquisition from James O''Hara and Eliza W. his wife, 10 Mar 1855 — SOURCE DEED NOW LOGGED AS PR-025. ''James Chara'' in this record = James O''Hara (OCR error confirmed). Second deed (unrelated): Reynolds S. Ackerson→Mathew R. Ackerson Jr., 14 Apr 1857, Mount Pleasant Twp.; cites will of James Scroggs; Margaret R. Scroggs intermarried Mathew R. Ackerson Jr.

BATCH: SRCH-002'
);

-- PR-014
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-014',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    14,
    '1853',
    'Deed — two segments: (1) warranty/receipt/acknowledgment for prior deed, $947.90; (2) coal and mineral rights conveyance, $8,020.85',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QFH?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Source document for the Romania Farm coal conveyance cited throughout Fayette search (PR-005, PR-006, PR-008, PR-009). Two deed segments on these pages. FIRST SEGMENT (end of deed, p.519): warranty clause, receipt for $947.90 ''in full of consideration,'' J.P. acknowledgment 14 May 1853 before Ira R. Butler; recorded 19 May 1853 by F.C. Morrison. SECOND SEGMENT (coal deed, main document): Connell Boyle, Rebecca his wife, and John Boyle convey all coal and mineral rights under Romania Farm (Fallowfield Twp., Lock No. 4, Monongahela River) to David and John A. Fitzsimmons for $8,020.85. Rights defined as all coal below a line 30 feet above the ''seventeen vein'' (named coal seam). Full metes-and-bounds description, 243 acres 9 perches. Romania Farm named explicitly in deed text. CRITICAL NEW: Title chain truncated at page end recites three prior conveyances — (1) Robert McMillan→Boyle brothers 1838; (2) Roswell Marsh/Williams estate→Boyle brothers 1850; (3) Felix Boyle→[continues on next page, not visible]. Felix Boyle appearing as a prior grantor to Connell and John is the first direct documentary evidence of Uncle Felix in the C.&J. Boyle land operations. RESEARCH NOTE: Felix Boyle''s role in this title chain requires dedicated follow-up — planned Felix Boyle search batch after SRCH-002 is complete. OCR: ''Monoorgahela'' = Monongahela; ''Cock No 4'' = Lock No. 4; ''State of Teal'' = ''top of vein''; ''real State worthless'' = ''real estate''; ''Jook. Butler'' = J[ohn] Butler or Ira R. Butler (two receipts); ''any pared'' = compared; various metes-and-bounds OCR errors throughout.

DATES: Both deeds dated: 14 May 1853. First deed (p.519) recorded: 19 May 1853. Coal deed recording date: not yet visible (continuation page needed).

NAMES: Connell Boyle (grantor, both deeds); Rebecca Boyle his wife (grantor, both deeds; separately examined); John Boyle (grantor, both deeds); David Fitzimons/Fitzsimmons (grantee); John A. Fitzimons/Fitzsimmons (grantee). Title chain (new): Robert McMillan (prior grantor, 1838); John Williams dec. (prior owner); Roswell Marsh (administrator, Williams estate, 1850 deed); Felix Boyle (prior grantor — role truncated). Officials: Ira R. Butler (witness and J.P., both deeds); John Scott (witness, first deed); F.C. Morrison (Recorder, first deed).

LOCATIONS: Fallowfield Township, Washington County PA; Romania Farm on Monongahela River near Lock No. 4; City of Allegheny PA (Fitzsimmons residence)

CITED RECORDS: Title chain recited in coal deed: (1) Robert McMillan→John and Connell Boyle, 8 Oct 1838, Book No.2 p.47; (2) Roswell Marsh (admin., John Williams estate)→Connell and John Boyle, 21 Feb 1850, Book H No.3 p.65; (3) Felix Boyle''s heirs→Connell and John Boyle, coal privileges, 28 Oct 1852, Book L Vol.3 pp.426–427, recorded 25 Apr 1853 (completed via PR-018). Cross-references throughout Fayette search: PR-005, PR-006, PR-007, PR-008, PR-009. Recording notation for p.519 deed: F.C. Morrison Recorder, 19 May 1853.

BATCH: SRCH-002'
);

-- PR-015
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-015',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    15,
    '1854',
    'Deed (quitclaim, release of trust interests)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9R2Z?view=fullText&keywords=Connell+Boyle%2CWashington&searchForm=advanced&lang=en',
    'Quitclaim deed releasing all right, title, and interest in four Carroll Township tracts and associated coal rights, covering pages 472–473 of this deed book. Property assembled by Boyles from: Samuel Davis (surface tracts, 31 ac. + 79 ac.); James Sampson & Mary (coal under 382 ac., 13 May 1854 — new name); David G. Rape (coal under 117 ac., 13 May 1854 — new name). Boyles conveyed entire package to J. Kennedy Moorhead 13 May 1854 (Book N Vol.3 p.339); Moorhead executed deed of trust back 7 Jun 1855 (Book Vol.3 p.139). This ca. 1863–64 quitclaim releases any remaining trust claims. Notable details: (1) ''Ex. Boyle'' appears in metes-and-bounds as a land reference — estate language suggesting Connell deceased by recording date, consistent with ca. 1860 death estimate; (2) ''C J. Boyle'' cited as property reference in boundary description, confirming firm name in third-party document; (3) Ira R. Butler Esq. listed as adjacent landowner — the same J.P. who witnessed nearly every Boyle deed also owned neighboring land, explaining his repeated availability; (4) Sampson and Rape as 1854 grantors are new names not previously documented as sellers to the Boyles. Coal described as ''6 or 7 foot vein commonly worked on the Monongahela River.'' Entries (ventilation/drainage shafts) specified at multiple locations including ''middle road leading to property of C J. Boyle.'' Sarah Pobs 1-acre lot excepted from tract 1 (also excepted in PR-002/PR-012 as ''Myers F.C.'' lot — may be same exception, different description). OCR: ''Campson'' = Sampson; ''Monongabela''/''Monongaheld'' = Monongahela; ''Frank/Pants'' = Frank (landowner); various metes-and-bounds OCR errors.

DATES: Sampson→Boyle and Rape→Boyle conveyances: 13 May 1854. Boyle→Moorhead deed: 13 May 1854 (Book N Vol.3 p.339). Moorhead deed of trust: 7 Jun 1855 (Book Vol.3 p.139). This quitclaim: ca. 1863–1864 (deed book dates).

NAMES: John Boyle (grantor/prior party); Connell Boyle (grantor/prior party); Rebecca A. Boyle (wife of Connell, prior party); J. Kennedy Moorhead (intermediate grantee 1854, then grantor 1855); James Sampson & Mary his wife (prior grantors to Boyles, 1854); David G. Rape (prior grantor to Boyles, 1854); Samuel Davis & wife (prior grantors to Boyles, date not stated). Noted in metes and bounds: ''Ex. Boyle'' (estate of Boyle — suggests Connell deceased by recording date); ''C J. Boyle'' property reference (confirms firm name C. & J. Boyle in third-party document). Ira Butler Esq. cited as adjacent landowner — same person as J.P. Ira R. Butler who witnessed Boyle deeds.

LOCATIONS: Carroll Township, Washington County PA. Four tracts: (1) 31 ac. 124 perches (excl. Sarah Pobs lot 1 ac.), Monongahela River low water mark; (2) 79 ac. 143 perches, Monongahela River low water mark; (3) coal vein (6–7 foot vein) under 382 ac. 84 perches; (4) all coal veins under 117 ac. 52 perches. Neighbors: Thomas Doyle, J. Sampson, John Venton, Harvey Lemoyne, Geo. W. Allen, Wm. Lambert, Robert Grant, Wm. Ammon, Wm. Wackerham, John Grant, Ira Butler Esq. (adjacent landowner — same Ira R. Butler who witnessed Boyle deeds), M. Teeple/Feeple, D.G. Rape, J. Campion, Robert Frank.

CITED RECORDS: Title chain recited: (1) Samuel Davis & wife→John and Connell Boyle (tracts 1 & 2, fee, date not stated); (2) James Sampson & Mary his wife→John and Connell Boyle, 13 May 1854 (tract 3 coal, 382 ac.); (3) David G. Rape→John and Connell Boyle, 13 May 1854 (tract 4 coal, 117 ac.); (4) John Boyle, Connell Boyle & Rebecca A. Boyle→J. Kennedy Moorhead, 13 May 1854, Deed Book N Vol.3 p.339; (5) J. Kennedy Moorhead→[party of first part in this deed], 7 Jun 1855, Book Vol.3 p.139 (deed of trust). Cross-references PR-004 (Moorhead deed), PR-005 (same property), PR-006, PR-014.

BATCH: SRCH-002'
);

-- PR-016
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-016',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    16,
    '1853',
    'Deed (coal/mineral rights) — continuation page of PR-014',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QK9?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Image 648 of 696 — next page after PR-014 (image 647). Same deed: Connell Boyle, Rebecca his wife, and John Boyle conveying coal, limestone, and other minerals under the Romania/Romanda Farm to David Fitzimmons and John A. Fitzimans, $8,020.85. This page shows the warranty clause, receipt ($947.90 in full of consideration), J.P. acknowledgment (14 May 1853, Ira R. Butler), recording notice (19 May 1853, F.C. Morrison), and the opening of the next deed text with the full consideration restated. Title chain repeats from PR-014 and adds: ''Felix Boyles her ,'' — still truncated; ''her'' almost certainly begins ''heirs'' or ''hereby,'' meaning this is a conveyance from Felix Boyle''s heirs (or Felix Boyle himself per some formulation) to Connell and John. Image 649 needed to complete this entry. Acreage discrepancy: ''143 acres and 9 perches'' here vs ''243 acres and 9 perches'' in PR-014 — 143 is likely correct, ''243'' in PR-014 is probably OCR noise. Mineral rights described as ''all the coal limestone and other minerals below a line thirty feet above the top of the seventeen vein.'' OCR: ''Romanda'' = Romania Farm; ''Fallinfield'' = Fallowfield; ''John Boyce'' = John Boyle; ''Jack Butler'' = Ira R. Butler; ''seventees vein'' = seventeen vein; ''right thousand'' = eight thousand.

DATES: Deed: 14 May 1853. Recorded: 19 May 1853 by F.C. Morrison.

NAMES: Connell Boyle (grantor); Rebecca Boyle his wife (grantor, separately examined); John Boyle (grantor — OCR renders as ''John Boyce'' in acknowledgment); David Fitzimmons/Fitzimons (grantee); John A. Fitzimans/Fitzemens/Fitzamine (grantee). Witnesses/officials: Ira R. Butler (witness and J.P. — OCR: ''Ira K Butler,'' ''Jack Butler''); John Scott (witness); Frank Butler (receipt witness — possibly OCR for Ira R. Butler); F.C. Morrison (Recorder). Felix Boyle''s heirs: title chain entry truncated, role not yet confirmed.

LOCATIONS: Fallowfield Township (''Fallinfield'' — OCR), Washington County PA; Romania/Romanda Farm, Monongahela River near Lock No. 4

CITED RECORDS: Continuation of PR-014. Title chain repeated: (1) Robert McMillan→John and Connell Boyle, 8 Oct 1838, Book No.2 p.47; (2) Roswell Marsh (admin. John Williams)→Connell and John Boyle, 21 Feb 1850, Book H Vol.3 p.65; (3) Felix Boyle''s her[s/heirs]→[truncated — deed continues on image 649, not yet retrieved]. Acreage discrepancy: this page reads ''143 acres and 9 perches''; PR-014 reads ''243 acres and 9 perches'' — ''243'' likely OCR error for ''143.''

BATCH: SRCH-002'
);

-- PR-017
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-017',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    17,
    '1881',
    'Deed (quitclaim, replacement for lost/mislaid deed)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1881–1882; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ9-YDBC?view=fullText&keywords=Connell+Boyle%2CConnell++Boyle%2CConnell+++Boyle%2CBoyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M9Z4-1SK',
    'MAJOR GENEALOGICAL RECORD. Quitclaim deed from Connell Boyle''s heirs to heirs of Henry Myers, replacing a lost/mislaid deed for a 2-acre Carroll Township parcel on the Monongahela River adjacent to Gen. J.K. Moorhead''s land. First document to name Connell Boyle''s complete family. Children confirmed: (1) Felix Boyle Jr. — almost certainly Captain Felix Boyle (1839–1916), the ''Jr.'' distinguishing him from uncle Felix Sr. (1813–1884); (2) Zephaniah M. Boyle — previously unknown, named for maternal grandfather Zephaniah Beall; (3) John Boyle Jr. — previously unknown; (4) Annie B. Boyle — married Frank McGurgan, previously unknown. Widow Rebecca A. Boyle still living 1881. John Boyle Sr. (Connell''s brother, business partner of C.&J. Boyle) still alive and signing in 1881 — remarkable longevity. D.O. Lambert (witness) is same Daniel O.C. Lambert from PR-013 (1857) — 24-year continuity in the Boyle legal circle. Legal background: John Boyle Sr. and Connell Boyle had agreed to convey this 2-acre river parcel to Henry Myers; Myers took possession, paid consideration, but deed was lost. Myers died before clear title was recorded; his heirs (Hiram, John N., George T. Myers) receive quitclaim in 1881 to establish record title. OCR: ''Rephania M Boyle'' / ''Jepenia M Boyle'' = Zephaniah M. Boyle; ''John Boyle S.'' = John Boyle Sr.; ''Frank Morgan'' = Frank McGurgan; ''Annie , Boyle McGurgan'' = Annie B. McGurgan née Boyle.

DATES: Deed: 15 Jun 1881. Acknowledged: 25 Jul 1881 (John Boyle Sr., Felix Boyle Jr., Mary A. Boyle); 26 Jul 1881 (John Boyle Jr., Zephaniah M. Boyle). Rebecca A. Boyle and Annie B./Frank McGurgan acknowledgment dates not explicitly stated in transcript. Consideration: $50.

NAMES: CONNELL BOYLE''S HEIRS (parties of first part): Felix Boyle Jr. (Connell''s son — almost certainly Captain Felix Boyle 1839–1916; ''Jr.'' distinguishes him from uncle Felix Boyle Sr. 1813–1884); Mary Ann/Mary A. Boyle his wife; Zephaniah M. Boyle (Connell''s son — named for grandfather Zephaniah Beall; NEW family member); John Boyle Jr. (Connell''s son; NEW); Frank McGurgan and Annie B. McGurgan née Boyle his wife (Connell''s daughter; NEW); Rebecca A. Boyle (Connell''s widow). John Boyle Sr. (Connell''s brother — still alive 1881; co-party to original Myers agreement). MYERS HEIRS (parties of second part): Hiram H. Myers; John N. Myers; George T. Myers — sole heirs of Henry Myers dec. Witnesses: D.O. Lambert (same as Daniel O.C. Lambert, witness in PR-013, 1857); Simon Rinehart. J.P.: unnamed (acknowledgment). Recorder: Work Hughes Jr. (unrelated Robbins-Taylor deed).

LOCATIONS: Carroll Township, Washington County PA. Tract: approx. 2 acres, Monongahela River (south boundary), Gen. J.K. Moorhead''s land (east), Reuben Harris''s land (north), unnamed land (west).

CITED RECORDS: Original agreement/covenant: John Boyle Sr. and Connell Boyle→Henry Myers (date not stated; predates Connell''s death ca. 1861). Lost/mislaid deed replaced by this instrument. Adjacent land: Gen. J.K. Moorhead (east) and Reuben Harris (north). Unrelated deed also on these pages: Thomas Burr Robbins & Mary W. Robbins + Thomas Taylor & Sarah Taylor, acknowledged 1 Mar 1882, recorded 13 Mar 1882 by Work Hughes Jr., Recorder.

BATCH: SRCH-002'
);

-- PR-018
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-018',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    18,
    '1853',
    'Deed (coal/mineral rights, p.521, continuation of PR-014/PR-016) + Agreement (p.522, pre-deed term sheet)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QF4?view=fullText&keywords=Connell+Boyle%2CConnell%2CBoyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Image 649 of 696 — third and final page of the Romania Farm coal deed (PR-014, PR-016) plus the April 1853 agreement that preceded it. TWO SEGMENTS. SEGMENT 1 (p.521, coal deed conclusion): Completes the Felix Boyle title chain entry from PR-016: ''Felix Boyle''s heirs to Connell and John Boyle for coal privileges, deed dated 28 Oct 1852, recorded Book L Vol.3 pp.426–427, April 25, 1853.'' Interpretation: ''Felix Boyle''s heirs'' almost certainly = heirs of Felix P. Boyle the patriarch (d.1841), NOT Felix Boyle Sr. (1813–1884, still living in 1852). Connell and John obtained coal rights from their father''s estate (with Felix Sr. signing as a co-heir) in Oct 1852, recorded Apr 1853, then immediately conveyed to Fitzsimmons May 1853. Alterations on lines 36–37 of the deed noted as made before signing, witnessed by O. Griffith and James Moffitt. John Boyle described as ''Carpenter'' in acknowledgment — first occupation documented for him. SEGMENT 2 (p.522, agreement dated 27 Apr 1853): Pre-deed term sheet between Connell Boyle, John Boyle and David Fitzsimmons, John A. Fitzsimmons. Key terms: all coal, limestone, minerals below 30 feet above the seven-foot vein on the Romania Farm; also the 4–5 acre Thomas Fry surface parcel purchased by Boyles in fee simple; land from Lock No.4 to ''P. Hargs'' (~90 rods), low water mark to hilltop. Payment: $1,000 on deed delivery; balance by mortgage; $33/acre for coal land measured by jury; three acres of coal opened on the farm reserved. Boyles reserve perpetual right of convenient road to the river for farm use. Right to convey coal over neighboring lands and railroad also granted. OCR: ''Romania/Remania Farm'' consistent; ''Ira R. Cutler'' = Ira R. Butler; ''John Stittimons'' = John A. Fitzsimmons; ''ceal'' = coal; ''mad'' = made.

DATES: Coal deed (p.521): acknowledged 14 May 1853; recorded 16 May 1853. Agreement (p.522): dated 27 Apr 1853; recorded 19 May 1853.

NAMES: Connell Boyle (grantor, both segments); Rebecca Boyle his wife (grantor, coal deed); John Boyle (grantor, both segments — described as ''Carpenter'' in acknowledgment; first occupation documented); David Fitzsimmons (grantee, both segments); John A. Fitzsimmons (grantee, agreement segment — OCR: ''John Stittimons''); Thomas Fry (prior grantor of surface parcel, not party to this deed). Witnesses (coal deed): O. Griffith; James Moffitt (noted alterations made before signing). Officials: Ira R. Butler/Cutler (J.P., 14 May 1853); F.C. Morrison (Recorder). Felix Boyle''s heirs: named in title chain as prior grantors of coal privileges (28 Oct 1852) — almost certainly heirs of Felix P. Boyle the patriarch (d.1841), not Felix Sr. (1813–1884 — still living in 1852).

LOCATIONS: Fallowfield Township, Washington County PA; Romania/Remania Farm near Lock No. 4, Monongahela River. Agreement includes: land from Lock No.4 to ''P. Hargs'' (~90 rods), low water mark to head of hill; Thomas Fry surface parcel (4–5 acres).

CITED RECORDS: Felix Boyle''s heirs→Connell and John Boyle, coal privileges, 28 Oct 1852, Book L Vol.3 pp.426–427, recorded 25 Apr 1853 (completes title chain in PR-014/PR-016). Agreement references: Thomas Fry as prior grantor of 4–5 acre surface parcel. Coal deed recorded 19 May 1853 (page 522 item) by F.C. Morrison. Page 521 item recorded 16 May 1853 by F.C. Morrison. Cross-references PR-014, PR-016 (earlier pages of same deed); PR-009 (grantee index listing pp.517, 519, 522).

BATCH: SRCH-002'
);

-- PR-019
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-019',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    19,
    '1853',
    'Deed (warranty + dower release, Ohio land)',
    'Wood County',
    'OH',
    'Wood County, Ohio. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-C375-XCDH?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Connell Boyle and Rebecca Boyle of Washington County PA sell 160 acres in Wood County, Ohio (NW quarter, Sec.24, Twp.7, Range 12) to Willard V. Way for $250, March 15, 1853 — two months before the Fitzsimmons coal deal. Immediately preceding entry in the same Wood County deed book is a U.S. land patent to Zephaniah Beall (May 21, 1835, signed by President Andrew Jackson) for land in the same county — almost certainly the origin of this parcel, descended to Rebecca through her father. Low price ($250 for 160 acres) explained by existing tax claim already held by Way, excepted from warranty. Rebecca releases dower separately for $1 consideration and is examined separate and apart from husband per standard PA procedure (acknowledgment taken in Washington Co. PA before Ira R. Butler). Record appears in Washington County PA FamilySearch search because acknowledgment was taken in Washington Co. before a Washington Co. J.P. and certified by the Washington Co. Prothonotary. Prothonotary certification dated 1858 — five years after the deed — suggests a delayed Ohio recording issue. This record establishes: (1) the Boyles had Ohio land interests, not only PA; (2) the Beall land patent connects the Boyle-Beall marriage to federal land in Ohio; (3) Connell was liquidating Ohio assets in early 1853 before the major Fitzsimmons coal transaction in May. OCR: ''Rebecca Seale'' = Rebecca Boyle; ''Willard P. Macy''/''Willard & Mary'' = Willard V. Way; ''Ira K. Butler'' = Ira R. Butler; ''of R Butter'' = Ira R. Butler.

DATES: Deed: 15 Mar 1853. Acknowledged before Ira R. Butler (Washington Co. PA J.P.): 15 Mar 1853. Prothonotary certification by James Brown: 23 Mar 1858. Received by Wood Co. Recorder: 8 Apr [1853]. Recorded in Wood Co.: 26 Apr 1853.

NAMES: Connell Boyle (grantor, Washington Co. PA); Rebecca Boyle his wife (grantor; separately examined; OCR renders surname as ''Seale'' — almost certainly OCR error for ''Boyle''); Willard V. Way (grantee, Wood Co. OH — OCR: ''Willard P. Macy,'' ''Willard & Mary''); Zephaniah Beall (prior patentee, 1835 — Rebecca''s father; land patent immediately precedes in same deed book). Witnesses: Ira K. Butler (witness — OCR variant of Ira R. Butler); Joshua O. Beall (witness — Beall family member, corrected from ''Joshua O. Reall'' in PR-019 via PR-020; his presence as witness supports land descending from Zephaniah Beall to Rebecca). Officials: Ira R. Butler (J.P., Washington Co. PA); James Brown (Prothonotary, Court of Common Pleas, Washington Co. PA — certified Butler''s authority); James Curtis (Recorder, Wood Co. OH).

LOCATIONS: Wood County, Ohio. NW quarter of Section 24, Township 7, Range 12, 160 acres. Grantors resident: Washington County, Pennsylvania.

CITED RECORDS: Zephaniah Beall U.S. land patent (Andrew Jackson, 21 May 1835, recorded Wood Co. Deed Book Vol.22 p.165) immediately precedes in same deed book — land likely descended to Rebecca Boyle (née Beall) through her father. Tax claim held by Willard V. Way cited as existing encumbrance excepted from warranty. Acknowledgment certified by James Brown, Prothonotary, Court of Common Pleas, Washington Co. PA, 23 Mar 1858 (5 years after deed — unusual; may indicate a delayed recording issue in Ohio).

BATCH: SRCH-002'
);

-- PR-020
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-020',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    20,
    '1853',
    'Deed (preceding page to PR-019) — beginning of Zephaniah Beall patent and Boyle→Way deed',
    'Wood County',
    'OH',
    'Wood County, Ohio. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-C375-X8LP?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Image 31 of 387 — preceding page to PR-019 (image 32). Shows the opening of the Zephaniah Beall land patent (Andrew Jackson, 21 May 1835) and the opening of the Connell Boyle→Willard V. Way deed (15 Mar 1853). Two corrections to PR-019: (1) Witness name is Joshua O. BEALL, not ''Joshua O. Reall'' — a Beall family member witnessed the deed, strongly supporting that this Ohio land descended to Rebecca through her Beall family. His presence in Washington County PA for the signing is notable. (2) Recording date on this page reads ''1858'' not ''1853'' — possible re-recording or late certification when the Prothonotary''s 1858 attestation was attached to satisfy Ohio requirements for an out-of-state J.P.''s acknowledgment. Rebecca identified as ''Rebecca Shouly'' in granting clause — consistent OCR error pattern with ''Rebecca Seale'' in PR-019; both are garbled readings of ''Boyle'' or possibly ''Beall/Beale''. Range description reads ''Cole'' in OCR — likely ''twelve'' (Range 12) as in PR-019.

DATES: Deed: 15 Mar 1853. Acknowledged: 15 Mar 1853 (Ira R. Butler, Washington Co. PA J.P.). Prothonotary certification: 23 Mar 1858. Recording in Wood Co.: ''Recorded the 26th 1858'' (this page) vs ''1853'' (PR-019) — discrepancy; see notes.

NAMES: Connell Boyle (grantor); Rebecca Boyle his wife (grantor — OCR: ''Rebecca Shouly''); Willard V. Way (grantee — OCR: ''Willard B. Nay,'' ''Willard P. Noy,'' ''Willard V. Moy''); Zephaniah Beall (land patent grantee, 1835). CORRECTED WITNESS: Joshua O. Beall (witness — Beall family member, not ''Joshua O. Reall'' as in PR-019; his presence as witness strongly supports land descending from Zephaniah Beall to Rebecca); Ira K. Butler (witness); Ira R. Butler (J.P.); James Brown (Prothonotary, Washington Co. PA); James Curtis (Recorder, Wood Co. OH).

LOCATIONS: Wood County, Ohio. NW quarter of Section 24, Township 7, Range [OCR: ''Cole'' = 12?], 160 acres. Grantors resident: Washington County, Pennsylvania.

CITED RECORDS: Preceding page to PR-019 (image 32). Same documents: Zephaniah Beall land patent (1835) and Connell Boyle→Willard V. Way deed (15 Mar 1853). Corrects PR-019 witness name: ''Joshua O. Reall'' = Joshua O. Beall (Beall family member). Recording date discrepancy: this page reads ''Recorded the 26th 1858''; PR-019 reads ''1853'' — possibly re-recorded or certified in 1858 when Prothonotary certification (23 Mar 1858) was attached.

BATCH: SRCH-002'
);

-- PR-021
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-021',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    21,
    '1853',
    'Deed (third image of same pages as PR-019 and PR-020)',
    'Wood County',
    'OH',
    'Wood County, Ohio. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-C375-X8P5?view=fullText&keywords=Connell+Boyle%2CConnell%2CBoyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Third FamilySearch image of the same Wood County deed book pages covering the Zephaniah Beall land patent (1835) and Connell Boyle→Willard V. Way deed (15 Mar 1853). FamilySearch indexed these pages three times as separate search results. Two minor improvements over prior images: (1) Range confirmed as ''twelve'' (Range 12) — PR-020 had OCR ''Cole''; (2) Rebecca''s name reads ''Rebecca Sealy'' here, the third OCR variant (PR-019: ''Seale''; PR-020: ''Shouly''). All three are garbled readings of the same cursive word, most likely ''Boyle.'' No new substantive content.

DATES: Same as PR-019 and PR-020. Deed: 15 Mar 1853. Prothonotary certification: 23 Mar 1858.

NAMES: Same parties as PR-019/PR-020. Rebecca OCR''d as ''Rebecca Sealy'' — third variant across three images (PR-019: ''Seale''; PR-020: ''Shouly''; PR-021: ''Sealy''). All garbled readings of same word, likely ''Boyle'' in cursive. Joshua O. Beall confirmed again as witness.

LOCATIONS: Same as PR-019/PR-020. Wood County, Ohio. NW quarter, Section 24, Township 7, Range 12 (confirmed — PR-020 had OCR ''Cole'').

CITED RECORDS: Third FamilySearch image of same Wood County deed book pages as PR-019 (image 32) and PR-020 (image 31). No new substantive information.

BATCH: SRCH-002'
);

-- PR-022
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-022',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    22,
    '1855',
    'Deed (warranty, Connell→John Boyle, 7/8 acre)',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WCGH?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Connell Boyle and Rebecca A. Boyle convey 7/8 of an acre to John Boyle (Connell''s brother) for $720, April 24, 1855 — three months after selling the Carroll Township river tract to James O''Hara (PR-002/PR-012). The $720 is real consideration, not nominal, indicating a genuine settlement between brothers rather than a gift transfer. Title chain cites Robert McMillan & Elizabeth his wife, 8 Oct 1838 — the identical deed and date as in the Romania Farm coal title chain (PR-014/PR-018, Book No.2 p.47), confirming the McMillan 1838 grant covered this parcel and the larger Romania Farm acreage. Neighbor ''Simon Wilson'' matches ''S. Wilson'' in Romania Farm metes-and-bounds (PR-014/PR-016). Parcel is almost certainly a small piece separated from the larger Romania Farm cluster. Partially addresses TODO-003 (McMillan→Boyle deed). Pattern: April–May 1855 sees Connell and John systematically dividing and selling off C.&J. Boyle assets — O''Hara deed (Feb 1855, PR-002), O''Hara acknowledgment (Mar 1855, PR-012), this Connell→John transfer (Apr 1855), John→Connell quitclaim (Mar 1857, PR-013). Thomas Collins as J.P. instead of usual Ira R. Butler. OCR: ''werion'' = coercion; ''Dutten Shannon'' possibly ''Dutton Shannon.''

DATES: Deed: 24 Apr 1855. Consideration: $720. Recorded: 5 Nov 1855 by Cyrus Underwood.

NAMES: Connell Boyle (grantor); Rebecca A. Boyle his wife (grantor, separately examined); John Boyle (grantee — Connell''s brother). Robert McMillan & Elizabeth his wife (prior grantors, 8 Oct 1838 — same deed as Romania Farm title chain). Officials: Thomas Collins (witness and J.P. — different from usual Ira R. Butler, same period); R. McDermott (witness); Cyrus Underwood (Recorder).

LOCATIONS: Washington County PA (exact township not stated in transcript; adjoining Simon Wilson, Dutten Shannon and others — same neighborhood as Romania Farm). Parcel: ''and seven eighths of an acre with allowance of six per cent for road purposes.''

CITED RECORDS: Title chain: Robert McMillan & Elizabeth his wife→[Connell and/or John Boyle], 8 Oct 1838 — SAME deed and date as Romania Farm title chain (PR-014/PR-018, Book No.2 p.47). Confirms McMillan 1838 grant covers both the Romania Farm acreage and this 7/8-acre parcel. Neighbor Simon Wilson appears as ''S. Wilson'' in Romania Farm metes-and-bounds (PR-014/PR-016). Unrelated deed also on these pages: John Weaver M.D. & Sarah F. Weaver→John Bracken, 18 Aug 1855, Main Street lot, Canonsburg, $1,500; title chain back to Joshua Emery 1833.

BATCH: SRCH-002'
);

-- PR-023
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-023',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    23,
    '1855',
    'Deed (warranty, Connell→John Boyle, preceding page missing)',
    'Washington County',
    'PA',
    'Washington. Deeds 1855–1857; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-M922?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Connell Boyle and Rebecca A. Boyle convey a second parcel to John Boyle for $310, April 26, 1855 — two days after PR-022 ($720 for a separate parcel). Together the two April 1855 deeds transfer $1,030 in property from Connell to John within 48 hours, confirming a structured asset settlement between the brothers. Property description is on the preceding page (not visible). FIRST DOCUMENTED APPEARANCE OF CAPTAIN FELIX BOYLE: ''Felix Beyle Jr.'' (OCR for Felix Boyle Jr.) signs as witness, approximately age 16. He is present when his parents execute this deed transferring property to his uncle John. Seven-month gap between deed execution (Apr 1855) and acknowledgment (Nov 19, 1855) is unusual — possibly reflects the brothers completing other transactions first before formalizing this one. Ira R. Butler again serves dual role of witness and J.P. OCR: ''Felix Beyle Jr.'' = Felix Boyle Jr.; ''examived report and apart'' = examined separate and apart; ''wereion'' = coercion; ''18455'' = 1855; ''State in Rebecca'' = Connell and Rebecca (OCR garble).

DATES: Deed: 26 Apr 1855. Receipt: 24 Apr 1855 (two-day discrepancy — receipt may predate formal deed execution). Acknowledged: 19 Nov 1855 (seven months after deed — notable delay). Recorded: 23 Nov 1855 by Cyrus Underwood.

NAMES: Connell Boyle (grantor); Rebecca A. Boyle his wife (grantor, separately examined); John Boyle (grantee, $310 consideration). CRITICAL: Felix Boyle Jr. (witness — OCR: ''Felix Beyle Jr.'' — Connell''s son, Captain Felix Boyle 1839–1916, approximately age 16; FIRST direct appearance in any document). Ira R. Butler (witness AND J.P. — dual role again). Cyrus Underwood (Recorder).

LOCATIONS: Washington County PA (exact township not visible — property description on preceding page).

CITED RECORDS: Property description on preceding page (not visible in this image). Two-day gap: receipt dated Apr 24; deed dated Apr 26. Companion to PR-022 (also Connell→John, Apr 24, 1855, $720) — two parcels transferred to John within 48 hours, total $1,030. Unrelated deed also on these pages: Israel Jennings & Nancy his wife→Jamima Beadle, 1 Sep 1849, 2.5 acres, Washington Co. PA, $280; title traced to Nathaniel Redd patent 2 Mar 1786.

BATCH: SRCH-002'
);

-- PR-024
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-024',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    24,
    '1864',
    'Deed (warranty, final link in Romania Farm chain)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9R4F?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Samuel McClean Jr. and Susannah McClean convey the Romania Farm and associated coal rights to Patrick Kerr and James Gillespie for $21,400 — the final transaction in the C.&J. Boyle property chain. RESOLVES TODO-007: Fitzsimmons→Wallace deed confirmed as June 28, 1858 (PR-008 had ''1856'' — wrong). RESOLVES PAGE NUMBER DISCREPANCY: Boyle→Fitzsimmons coal deed cited as Deed Book Vol.3 p.219, confirming PR-005''s ''219'' was correct and the ''519'' in PR-009 and PR-014 was OCR noise throughout. NEW: Washington County Orphans Court No.23, May Term 1863 authorized sale (separate from Allegheny Co. GV-001 proceedings). NEW: 8 acres 62 perches of coal excluded from this conveyance — a carved-out body not previously documented. The $21,400 price (1864) vs. $8,020.85 for coal rights alone (1853) shows the property more than doubled in value in 11 years as coal mining industrialized along the Monongahela. James O''Hara confirmed as north neighbor of the 28-acre river tract — the same O''Hara who bought the Carroll Township river surface from the Boyles in February 1855 (PR-002), confirming all these transactions were geographically contiguous. Thomas Fry to the south is the same Fry whose land the Boyles purchased per the PR-018 agreement. OCR: ''Jock No 4'' = Lock No.4; ''Connel Bodle'' = Connell Boyle; ''seven fort vein'' = seven foot vein; ''Administrator deborn'' = administrator de bonis non; ''moval'' = mineral.

DATES: This deed (McClean→Kerr & Gillespie): acknowledged 8 Jun 1864 (Allegheny Co.); recorded 25 Jun 1864 by Alvin King, Recorder (F. London, Dep.).

NAMES: Samuel McClean Jr. (grantor); Susannah McClean his wife (grantor, separately examined); Patrick Kerr and James Gillespie (grantees — ''Kerr & Gillespie'' referenced in earlier records as eventual owners). Prior parties recited: Connell Boyle & wife, John Boyle (original 1853 grantors); David Fitzsimmons & wife, John A. Fitzsimmons (intermediate owners); Thomas Wallace dec. (intermediate owner); Wm. P. Baine (administrator, Fitzsimmons and/or Wallace estate). Officials: Adel/Abdel/Aldiel McClure (witness, Recorder of Deeds and J.P., Allegheny Co.); Alvin King (Recorder, Washington Co.); F. London (Deputy Recorder).

LOCATIONS: Fallowfield Township and Carroll Township, Washington County PA. Romania Farm near Lock No.4, Monongahela River. Two tracts conveyed: (1) coal, limestone, and other minerals under Romania Farm acreage — all below 30 feet above the seven-foot vein (same as PR-014); EXCLUDING a body of 8 acres 62 perches of coal (new exclusion, not previously noted); (2) 28 acres 2 rods 31 perches, surface tract in the Monongahela River at Fallowfield near Lock No.4 — bounded N by land of James O''Hara (same O''Hara who bought river tract from Boyles Feb 1855, PR-002), E by Monongahela River, S by Thomas Fry''s land, W by the coal tract. Total aggregate: 420 acres.

CITED RECORDS: Full title chain recited: (1) Connell Boyle & wife & John Boyle→David & John A. Fitzsimmons, 14 May 1853, Deed Book Vol.3 p.219 (CONFIRMED — resolves OCR discrepancy; earlier records read ''519''); (2) David Fitzsimmons & wife & John A. Fitzsimmons→Thomas Wallace, 28 Jun 1858 (CONFIRMED — closes TODO-007; PR-008 had ''1856'' which was wrong); (3) Wm. P. Baine (admin. David Fitzsimmons estate) → Samuel McClean, 13 Oct 1863, Deed Book Vol.4 p.35 — authorized by Orphans Court Allegheny Co. No.42 Dec Term 1860 (GV-001) AND Orphans Court Washington Co. No.23 May Term 1863 (NEW). Unrelated deed also on page: Wm. Taylor & Catharine Taylor→Dalton Shannon, 18 Mar 1864, Carroll Township.

BATCH: SRCH-002'
);

-- WL-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'WL-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'WL'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    25,
    '1849',
    'Will (Connell Boyle as subscribing witness)',
    'Washington County',
    'PA',
    'Washington. Wills 1848–1857; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-8991-MB57?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M985-1TM',
    'Connell Boyle appears as a subscribing witness to the will of Harry Sampson, executed 14 May 1849, proved 10 Aug 1851. Connell deposed before Register Odel Squier that he was personally present, saw the testator execute the will, and heard him declare it his last will and testament. Co-witness: Samuel Butler. This is not a property transaction but establishes that Connell had a prior social relationship with the Sampson family: James Sampson (Harry''s brother and executor here) sold coal rights to John and Connell Boyle five years later, 13 May 1854 (PR-015). The Sampson name also appears repeatedly in Romania Farm metes-and-bounds as an adjacent landowner. These were neighbors and acquaintances, not strangers transacting at arm''s length. Harry Sampson''s estate went principally to James Sampson, confirming James was the senior surviving brother and likely the landowner Connell dealt with in 1854. OCR: ''W Press Correll Boyle'' = [in presence of] Connell Boyle; ''Brother Lampson'' = Brother Sampson (James); ''Louier Register'' = [Odel] Squier Register; ''Band Township'' = uncertain (possibly North Bethlehem or adjacent township).

DATES: Harry Sampson will: executed 14 May 1849; proved 10 Aug 1851; registered 10 Sep 1851 (OCR: ''1857'' likely error for 1851). Connell Boyle deposed as witness: 10 Aug 1851.

NAMES: Harry Sampson (testator); James Sampson (sole executor and principal beneficiary — same James Sampson who sold coal rights to Boyle brothers 1854, PR-015); Cathrine Braged (half-sister); Harry People (nephew, $1,000 bequest). CONNELL BOYLE (subscribing witness — deposed 10 Aug 1851 before Register Odel Squier); Samuel Butler (co-witness). Register: Odel Squier.

LOCATIONS: Washington County PA. Harry Sampson''s real estate in ''Band Township'' (OCR — possibly North or East Bethlehem Twp.).

CITED RECORDS: James Sampson (Harry''s brother and executor here) is the same James Sampson who conveyed coal rights to John and Connell Boyle, 13 May 1854 (PR-015) — confirming prior social relationship. Harry Sampson''s real estate was in ''Band Township'' Washington County (OCR; probably North or East Bethlehem Twp.). Other wills on same pages: Daniel Vanvoorhis/Nanvoose (16 Jun 1851, proved 19 Aug 1851); Daniel Moore of Borough of Washington (incomplete).

BATCH: SRCH-002'
);

-- PR-025
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-025',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    26,
    '1855',
    'Deed (warranty with coal reservation, O''Hara→Boyle brothers)',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZF1?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'James O''Hara and Eliza W. O''Hara sell ~100 acres 102 perches in Carroll Township to Connell Boyle and John Boyle for $2,589.08, March 10, 1855 — just three weeks after the Boyles sold O''Hara a different adjacent parcel for $2,000 (PR-002, Feb 20, 1855). These were neighboring parcels exchanged in the same month, not a single transaction. CRITICAL: O''Hara reserves ALL coal, mineral, and other mineral rights beneath the surface, with right to dig, mine, and carry away — he sold the Boyles the farmland surface only. This is the opposite of the Boyles'' own strategy with Fitzsimmons (where they sold coal rights and initially retained some surface). SOLVES PR-013 MYSTERY: ''James Chara and Eliza his wife'' in PR-013 = James O''Hara and Eliza W. O''Hara; the March 10, 1855 date and 100-acre acreage match exactly. PR-013 (John→Connell quitclaim, Mar 1857, $1 nominal) is John''s release of his interest in this O''Hara-acquired parcel to Connell. Boundary description explicitly references ''lands conveyed by said Connell and John Boyles to said James O''Hara'' confirming geographic adjacency of the Feb and Mar 1855 transactions. Title through Robert Grant Sr.''s 1845 will to Robert Grant Jr., then Vanvoorhis, then O''Hara. Noah and Elge Grant retain surface passage rights (exceptions). P.K. Moorhead again appears as neighbor. OCR: ''wal metal'' = coal metal (minerals); ''water-coanes'' = water-courses; ''wercion'' = coercion.

DATES: Deed: 10 Mar 1855 (three weeks after Boyle→O''Hara deed, PR-002, 20 Feb 1855). Recorded: 26 Jun 1855.

NAMES: James O''Hara and Eliza W. O''Hara his wife (grantors, City of Allegheny); Connell Boyle and John Boyle (grantees, Carroll Township). Title chain: Robert Grant Sr. (testator, will 1845); Robert Grant Jr. & Mary (prior grantors 1852); Abraham Vanvoorhis & Mary (prior grantors 1852). Exceptions: Noah and Elge Grant (surface passage rights reserved). Prior deed acknowledgment on same pages: James McAlester (J.P.); Cyrus Underwood (Recorder).

LOCATIONS: Carroll Township, Washington County PA. ~100 acres and 102 perches near Monongahela River. Neighbors: heirs of George Grant, Townsend & C., lands conveyed by Boyles to O''Hara (PR-002 parcel, adjacent), P.K. Moorhead, James Sampson, heirs of Robert Grant Sr. dec., William Wickersham.

CITED RECORDS: Title chain: Robert Grant Sr. will, 10 Sep 1845, Will Book 7 pp.51–52; Robert Grant Jr. & Mary→Abraham Vanvoorhis, 26 May 1852; Abraham Vanvoorhis & Mary→James O''Hara, 3 Jul 1852, Deed Book M Vol.3 pp.23–24. Boundary references ''lands conveyed by said Connell and John Boyles to said James O''Hara'' — i.e. PR-002/PR-012 (Feb 1855, Boyle→O''Hara deed). SOURCE DEED FOR PR-013: ''James Chara and Eliza his wife'' in PR-013 = James O''Hara and Eliza W. O''Hara confirmed. Recorded 26 Jun 1855 by Cyrus Underwood.

BATCH: SRCH-002'
);

-- PR-026
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-026',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    27,
    '1854',
    'Two deeds: (1) Rape→Boyle, coal/mineral rights, $1,000; (2) Boyle→Moorhead, trust arrangement, $20,042.40 (truncated)',
    'Washington County',
    'PA',
    'Washington. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-C9MX-W?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Two deeds, both May 13, 1854 — part of a coordinated multi-party closing with the Sampson conveyance (PR-015). DEED 1: David G. Rape conveys coal and mineral rights under 117 acres 52 perches in Carroll Township to John and Connell Boyle for $1,000. This is the SOURCE DEED for the ''David G. Rape→Boyle brothers, 13 May 1854'' entry in PR-015''s title chain. Metes and bounds match PR-015''s fourth tract exactly; ''Butler Esq.'' appears again as an adjacent landowner boundary marker. DEED 2 (truncated): John and Connell Boyle convey property to ''Judy Moorhead'' of Pittsburgh for $20,042.40. ''Judy Moorhead'' = J. Kennedy Moorhead (OCR noise on the given name). Consideration of $20,042.40 (~$750,000 in 2026 terms) is almost certainly a trust/financing arrangement rather than an arm''s-length sale — PR-015 confirms Moorhead executed a deed back to the Boyles in June 1855 ''creating certain trusts and for other purposes'' (Book Vol.3 p.139). The inflated stated consideration is standard in such arrangements. Partially addresses TODO-011 (Boyle→Moorhead deed source). Deed 2 property description and execution details on continuation page not yet retrieved.

DATES: Both deeds: 13 May 1854. Rape deed recorded: 15 May 1854. Moorhead deed recording date: not visible (continuation page needed).

NAMES: DEED 1 — David Gardner Rake/Rape (grantor — OCR: ''Rabe,'' ''Robe,'' ''Rope''; = David G. Rape from PR-015); John Boyle and Connell Boyle (grantees). Witnesses: Ira R. Butler (also ''Ira B. Blitter'' OCR); M. Cullar. Recorder: F.C. Morrison. DEED 2 — John Boyle and Connell Boyle (grantors); ''Judy Moorhead'' of Pittsburgh (grantee — OCR for J. Kennedy Moorhead; ''Judy'' = garbled ''J.K.'' or ''J. [Kennedy]''). Deed 2 truncated — continuation page needed.

LOCATIONS: Carroll Township, Washington County PA. Rape parcel: 117 acres 52 perches (matches PR-015 fourth tract) — neighbors: M. Teeple/Leeple, James Sampson, William Amon/Ammon, William Wilkerham, Ira Butler Esq. (adjacent landowner, boundary marker again). Moorhead deed: property description on continuation page.

CITED RECORDS: Rape deed: recorded 15 May 1854 by F.C. Morrison. Matches PR-015 fourth tract exactly (117 ac. 52 perches, same neighbors). Moorhead deed: cited in PR-015 as Deed Book N Vol.3 p.339, 13 May 1854; Moorhead executed deed back to Boyles 7 Jun 1855, Book Vol.3 p.139 (trust instrument). See TODO-011.

BATCH: SRCH-002'
);

-- WL-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'WL-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'WL'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    27,
    '1846',
    'Will (Connell Boyle and Felix Boyle as subscribing witnesses)',
    'Washington County',
    'PA',
    'Washington. Wills 1848–1857; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-8991-MBJ9?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M985-1TM',
    'Connell Boyle and Felix Boyle (''Fely Boyd'') both appear as subscribing witnesses to the will of William Weir of Carroll Township, executed April 22, 1846. Connell deposed in person at probate (April 17, 1847). Felix Boyle was absent from the county at probate time — William Calbraith attested to knowing Felix''s handwriting to satisfy the court (December 30, 1851). Felix''s absence from Washington County between 1847 and 1851 is notable and unexplained. A possible third witness ''Mary Boyce'' appears in the signing clause — possibly Mary Boyle, OCR uncertain. William Weir was a Carroll Township neighbor, same township as the Boyle land operations. This is the second will witness appearance for Connell (after WL-001, Harry Sampson 1849) and confirms both Connell and Felix were integrated into the Carroll Township community as trusted witnesses for neighbors'' legal documents, consistent with family''s documented civic standing. Felix being named ''Fely Boyd'' is a useful OCR signature for future searches.

DATES: William Weir will: executed 22 Apr 1846. Connell Boyle deposed as witness: 17 Apr 1847 before Register William Warkman. Felix Boyle handwriting attested by William Calbraith: 30 Dec 1851 before Register John Carson Jr. Letters testamentary: 6 Jan 1855.

NAMES: William Weir (testator, Carroll Township); Samuel [Echer?] (executor). Subscribing witnesses: CONNELL BOYLE (deposed in person, 17 Apr 1847); ''Fely Boyd'' = Felix Boyle (co-witness — absent from county at probate; handwriting attested by William Calbraith); ''Mary Boyce'' (possible third witness — OCR uncertain, may be Mary Boyle or OCR error). Register: William Warkman (1847); John Carson Jr. (1851). William Calbraith (attested Felix Boyle''s handwriting).

LOCATIONS: Carroll Township, Washington County PA (William Weir''s residence — same township as Boyle land).

CITED RECORDS: Other wills on same pages: Dickerson Roberts (30 Aug 1851, witnesses William Jones & B. Reynolds); Hiram Hill of Cecil County (Jan 1852, witnesses Alexander Boon et al.) — both unrelated to Boyles.

BATCH: SRCH-002'
);

-- PR-027
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-027',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    28,
    '1854',
    'Deed (Boyle→Moorhead trust, continuation of PR-026)',
    'Washington County',
    'PA',
    'Washington. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-C9M8-P?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Continuation page of the Boyle→Moorhead deed (PR-026, image 523; this is image 525). CORRECTS GRANTEE NAME: receipt clearly reads ''James K. Moorhead'' — not ''J. Kennedy Moorhead'' as previously assumed, and not ''Judy Moorhead'' (OCR noise). James K. Moorhead may or may not be the same person as the ''J. Kennedy Moorhead'' cited in PR-004 and PR-015; the initial discrepancy (K. vs. Kennedy) warrants verification. Rebecca A. Boyle signs and is separately examined — her presence confirms this is the full partnership asset transfer, not just John and Connell acting alone. David G. Rape (who sold coal rights to Boyles earlier the same day, PR-026) appears as a witness here — he was present for the entire sequence of transactions on May 13, 1854, signing first as grantor then as witness. Property description explicitly cross-references the Sampson and Rape same-day deeds, confirming all three were a coordinated closing. Closes TODO-011 for the Boyle→Moorhead source deed (though Moorhead→Boyle trust deed back, 7 Jun 1855, Book Vol.3 p.139, still not retrieved). OCR: ''James R. Toothert Foyle'' = James K. Moorhead (grantee in habendum clause); ''Channell R. Boyle'' = Connell Boyle; ''K.C. Morrison'' = F.C. Morrison.

DATES: Deed: 13 May 1854. Acknowledged: 13 May 1854 before Ira R. Butler J.P. Recorded: 15 May 1854.

NAMES: John Boyle (grantor); Connell Boyle (grantor); Rebecca A. Boyle his wife (grantor, separately examined). Grantee: JAMES K. MOORHEAD of Pittsburgh (CORRECTED — PR-026 and prior records had ''J. Kennedy Moorhead'' or ''Judy Moorhead''; full name here reads ''James K. Moorhead''). Witnesses: Ira R. Butler (also J.P.); David G. Robe/Rape (co-witness — same David G. Rape who sold to Boyles earlier same day in PR-026; witnessed the deed that immediately followed his own conveyance); ''Channell R. Boyle'' (OCR artifact — probably Connell Boyle appearing in witness line, a transcription quirk). Receipt signed by John Boyle and Ira R. Butler. Recorder: F.C. Morrison.

LOCATIONS: Carroll Township, Washington County PA. Property covers Sampson parcel and Rape parcel (117 ac. 52 perches) acquired same day; full description spans PR-026 and this page.

CITED RECORDS: Continuation of PR-026 (image 523; this is image 525). Property description references the Sampson deed (''deed bearing even date herewith James [Sampson] wife conveyed'') and Rape deed (''deed bearing even date herewith David Gardener [Rape]'') — all three transactions closed simultaneously 13 May 1854. Recorded 15 May 1854 by K.C. Morrison (OCR for F.C. Morrison). Unrelated deed also on these pages: McConnell executor of Freddis Scott→George Boyd, Francis Boyd, Prestly Bond, 20 May 1854, Hanover Township, 73 acres.

BATCH: SRCH-002'
);

-- PR-028
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-028',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    29,
    '1855',
    'Deed (quitclaim, Boyle brothers + Rebecca→John Boyle, Romania tract Fallowfield, truncated)',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WCP3?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'John Boyle Sr. and Connell Boyle with Rebecca his wife convey two parcels in Fallowfield Township to ''John Boyle'' (party of second part — possibly John Jr., Connell''s son) for $720. Both parcels are explicitly described as ''part of the Romania tract'' — first document to use this phrase and to confirm the Romania Farm/tract extended into Fallowfield Township (previously associated primarily with Carroll Township in the coal deeds). First parcel: 61.5 acres, from Roswell R. Mark/Marsh as administrator of John Williams dec., deed dated 27 Feb 1840 — PARTIALLY ADDRESSES TODO-004 but introduces date discrepancy: PR-014/PR-018 cited this Williams estate deed as ''21 Feb 1850''; this record gives ''27 Feb 1840.'' Either two separate Williams estate conveyances to the Boyles (one in 1840 covering surface, one in 1850 covering coal rights?) or OCR error in earlier records. Second parcel: 54 acres (truncated — continuation page needed). Same $720 consideration as PR-022 (which covered a different parcel in Carroll Township); connection unclear. The grantor structure (John Sr. AND Connell/Rebecca together) shows John Sr. still held interest in Fallowfield Romania tract land alongside Connell in 1855, consistent with the ongoing partnership dissolution. Deed text truncated at page end.

DATES: Date of Boyle deed not yet visible (continuation page needed). Blayney deed acknowledged: 14 Feb 1855; recorded by Cyrus Underwood.

NAMES: John Boyle (grantor, party of first part — John Boyle Sr., Connell''s brother); Connell Boyle (grantor); Rebecca his wife (grantor); John Boyle (grantee, party of second part — possibly John Boyle Jr., Connell''s son, from PR-017; or same John Sr. in a different capacity). Rosswell R. Mark (= Roswell Marsh, OCR) administrator of John Williams dec. (prior grantor, 27 Feb 1840). Cyrus Underwood (Recorder).

LOCATIONS: Fallowfield Township, Washington County PA. Two parcels, part of ''the Romania tract'': (1) 61.5 acres with allowances — from Roswell Mark/Marsh, Williams estate, 27 Feb 1840; (2) 54 [acres, truncated]. Romania tract confirmed as extending into Fallowfield Township — first explicit statement of this.

CITED RECORDS: Title chain for first parcel: Rosswell R. Mark (= Roswell Marsh), administrator of John Williams dec.→John and Connell Boyle, 27 Feb 1840. DATE DISCREPANCY with PR-014/PR-018 which cited this deed as ''21 Feb 1850'' — either two separate Williams estate conveyances (1840 and 1850) or OCR error in earlier records. Second parcel title chain truncated. Adjacent to PR-022 (image 661, same deed book), same $720 consideration — possibly connected transactions or coincidence. Unrelated deed also on pages: Henry Blayney & Elizabeth→Cadwalader Blayney, 12 Dec 1854, West Finley Township, 11 acres 5 perches on Robisons Fork of Wheeling Creek, $676.

BATCH: SRCH-002'
);

-- MG-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'MG-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'MG'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    30,
    '1854',
    'Mortgage (Moorhead→Boyle) + assignments + power of attorney',
    'Washington County',
    'PA',
    'Washington. Mortgages 1841–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QHV-V38P-N98N-W?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Mortgage from James K. Moorhead to John and Connell Boyle for approximately $1,000, May 13, 1854 — same day as the Rape→Boyle coal deed (PR-026) and the Boyle→Moorhead deed of trust (PR-026/PR-027). REVEALS FINANCIAL STRUCTURE: The May 13, 1854 transactions were not cash exchanges but a chain of paper instruments. Moorhead gave the Boyles a mortgage (this record) as part of the deed of trust arrangement; the Boyles immediately assigned the mortgage payments to their own creditors — first to Sampson (same day, May 13), then the first payment ($900+ due May 13, 1856) assigned to Thomas Miller of Pittsburgh via Cooper Morrison as attorney (May 26, 1854). James Sampson, who sold coal rights to the Boyles on May 13 (PR-015), was paid not in cash but by assignment of Moorhead''s mortgage payments — a chain of IOUs rather than actual money changing hands. Cooper Morrison (Washington County Recorder) appointed as attorney, suggesting a trusted neutral intermediary was needed for the Thomas Miller assignment. John Coyle again as Connell''s attorney-in-fact — Connell continues to operate through a representative rather than appearing in person. OCR is severely degraded throughout; many figures and names are uncertain. ''Sampson'' assignee is inferred from context — OCR reads ''unto Sampson'' but may be garbled.

DATES: Mortgage: 13 May 1854. Acknowledged before Alderman Archer All: 13 May 1854. First assignment (to Sampson): 13 May 1854. Power of attorney appointing Cooper Morrison: 26 May 1854. Acknowledged before Alderman W. Lewis, Allegheny County: 26 May 1854. Recorded: 28 May 1854 by F.C. Morrison. First payment due: May 13, 1856.

NAMES: James K. Moorhead (mortgagor — reverse of expected; Moorhead owes the Boyles ~$1,000 as part of the May 13 1854 arrangement); John Boyle and Connell Boyle (mortgagees/creditors). Connell Boyle represented by attorney-in-fact John Coyle/Cogle (same as prior appearances). Assignments: Sampson (first assignee, same day — probably James Sampson who sold coal rights to Boyles same day, paid via assignment rather than cash); Thomas Miller Esq. of Pittsburgh (second assignee, via power of attorney). Cooper Morrison Esq. (Washington County Recorder, appointed as attorney by Boyles to make Thomas Miller assignment — unusual use of an official as legal intermediary). Alderman Archer All (Moorhead''s acknowledgment); Alderman W. Lewis (Boyle power of attorney acknowledgment, Allegheny County). F.C. Morrison (Recorder).

LOCATIONS: Washington County PA (mortgage property not fully described in visible text).

CITED RECORDS: BOOK/PAGE CONFIRMED via mortgage index (image 439): Vol.1 Page 366, indexed twice (once under John Boyle, once under Connell Boyle). Also in index: Moorhead J.K. By Exr\u2192Recorder of Deeds, Vol.19 p.580, 2 Jan 1890, Power of Attorney \u2014 Moorhead''s executor still settling Washington County business 6 years after his death. Same-day transactions (13 May 1854): Rape→Boyle coal deed (PR-026), Boyle→Moorhead deed of trust (PR-026/PR-027), this Moorhead→Boyle mortgage. Assignment to Sampson on same day — James Sampson who sold coal rights to Boyles same day (PR-015) — Sampson paid not in cash but by assignment of Moorhead mortgage payments. Thomas Miller of Pittsburgh receives first payment assignment (due May 13, 1856) via Cooper Morrison as attorney. Separate unrelated mortgage on same pages: School Directors of Monongahela City→F.G. & Susanna Huffman, Somerset County, December 1850, $3,000.

BATCH: SRCH-002'
);

-- PR-029
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-029',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    31,
    '1855',
    'Deed (beginning pages of PR-002/PR-012 — same document, Washington search result)',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1855; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZNR?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Same document as PR-002 (Fayette search) and PR-012 (Washington search continuation) — Boyle→O''Hara Carroll Township deed, 20 Feb 1855, $2,000. This view shows the deed''s opening pages with property description and title chain not previously captured. KEY NEW: Samuel Davis and wife conveyed this Carroll Township tract to Connell and John Boyle by deed dated 30 May 1833, recorded Deed Book 2 Oct 2d p.379 — the earliest documented Boyle land acquisition, five years before the McMillan 1838 deed. The Boyles were assembling the Romania Farm cluster from at least 1833. H. Myers & Co. two-acre lot explicitly excepted from the O''Hara conveyance, consistent with the prior covenant with Henry Myers referenced in PR-017 (1881 quitclaim deed). Moorhead tract referenced as adjacent boundary with specific deed date and book (confirms PR-026/PR-027). Metes and bounds begin at Monongahela River low water mark, with 109 perches of river frontage — substantial commercial waterfront. On Connell''s repeated absence from deeds: chronic lung disease (probable COPD given occupational exposure and cigar habit) would explain difficulty traveling and appearing in person; Rebecca''s consistent presence on these deeds suggests she was a genuine operational partner in the enterprise, not merely fulfilling the dower release requirement.

DATES: Deed: 20 Feb 1855. Recorded: see PR-002/PR-012.

NAMES: John Boyle and Connell Boyle and Rebecca A. his wife (grantors); James O. Hard/O''Hara (grantee, City of Allegheny). Prior grantor: Samuel Davis & wife (30 May 1833, Deed Book 2 Oct 2d p.379 — EARLIEST documented Boyle acquisition). Moorhead cited as adjacent landowner (May 13, 1854 deed, Book N 3d p.339). H. Myers & Co. (holder of excepted 2-acre lot).

LOCATIONS: Carroll Township, Washington County PA. Monongahela River tract. Beginning at low water mark on the Monongahela River at SW corner of Moorhead tract; metes and bounds: N 26°E 44 perches to O''Hara line; N 76°W 42.8 perches to red oak; W 89° 61 perches to post; S 29.5°W 50 perches to low water mark; 109 perches along river to place of beginning. Excepting: H. Myers & Co. small lot ~2 acres.

CITED RECORDS: Same document as PR-002 and PR-012 (Fayette search) — this view shows the deed''s beginning (property description and title chain) while PR-002/PR-012 showed the acknowledgment/signature pages. Title chain: Samuel Davis & wife→Connell and John Boyle, 30 May 1833, Deed Book 2 Oct 2d page 379 (EARLIEST DOCUMENTED BOYLE ACQUISITION — predates McMillan 1838 by 5 years). Moorhead tract boundary reference: deed 13 May 1854, Book N 3d p.339 (confirms PR-026/PR-027). H. Myers & Co. two-acre exception: confirms PR-017 (1881 Myers quitclaim replacing a lost/mislaid deed).

BATCH: SRCH-002'
);

-- PR-030
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-030',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    32,
    '1845',
    'Deed of gift (parents→daughter and son-in-law, natural love and affection)',
    'Wood County',
    'OH',
    'Wood County, Ohio. Deeds 1844–1847; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-C375-JVGF?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Zephaniah Beall and Mary his wife of Washington County PA convey 160 acres in Wood County Ohio to their daughter Rebecca Ann Boyle and her husband Connell Boyle as a gift (''natural love and affection'' — no monetary consideration), July 23, 1845. This is the same parcel that Connell and Rebecca later sold to Willard V. Way in March 1853 (PR-019/PR-020/PR-021). MAJOR NEW INFORMATION: (1) REBECCA''S FULL NAME: Rebecca Ann Boyle née Beall — the ''A.'' in earlier records stands for Ann; (2) REBECCA''S MOTHER: Mary Beall, Zephaniah''s wife — first documented appearance; (3) GIFT DEED: Zephaniah gave his daughter and son-in-law the Ohio land seven years into the marriage, confirming he accepted Connell by 1845 despite initial probable objections to an Irish Catholic match; (4) CONNELL AND REBECCA''S 1845 RESIDENCE: Jacksonville, Washington County PA; (5) FELIX BOYLE SR. as witness in Washington County, July 1845 — resolves earlier question about Felix''s whereabouts (WL-002 showed him absent from county during probate of a 1846 will, but he was present in Jul 1845); (6) FEDERAL PATENT NO. 10,828 confirmed — closes TODO-005; (7) Zephaniah described as ''Farmer'' — occupation confirmed. The gift of Ohio land in 1845 — after seven years of marriage and while the C.&J. Boyle boatyard was established — suggests Zephaniah recognized Connell''s standing and was providing for Rebecca''s future security. The land was held for eight years before being liquidated in 1853 as part of the financial restructuring. Mary Beall separately examined confirms the standard dower protection applied even in intra-family gift deeds. OCR severely degraded throughout; grantor name rendered variously as ''Lepht Beall,'' ''Lethaniah,'' ''Lochaniah''; Rebecca rendered as ''Catharine Seall'' in one line.

DATES: Deed: 23 Jul 1845. Acknowledged before James G. Part J.P., Washington County PA: 28 Jul 1845. Recording date: not stated in visible text.

NAMES: Zephaniah Beall (grantor — identified as ''Farmer,'' Washington County PA; OCR: ''Lethaniah,'' ''S Chancate Seall,'' ''Lochaniah Beall''); Mary Beall his wife (grantor — FIRST APPEARANCE; Rebecca''s mother; separately examined; OCR: ''Shary,'' ''share his wife''); Connell Boyle (grantee); Rebecca Ann Boyle his wife (grantee — FULL NAME NOW CONFIRMED: Rebecca Ann; identified as ''daughter'' of Zephaniah and Mary; OCR: ''Catharine Seall our daughter'' garbles her name but relationship explicit). Witnesses: Felix Boyle (= Felix Boyle Sr., Connell''s brother — present in Washington County Jul 1845; same Felix who co-witnessed William Weir will 1846 in WL-002); John Granlee. J.P.: James G. Part (Washington County PA).

LOCATIONS: Wood County, Ohio. NW quarter of Section 24, Township 7 North, Range 12, 160 acres (same parcel as PR-019/PR-020/PR-021). Grantors resident: Washington County PA. Connell and Rebecca resident: Jacksonville, Washington County PA (1845).

CITED RECORDS: Federal land patent: United States→Zephaniah Beall, 21 May 1835, Patent Book No.22 p.165, Patent No.10,828 (CLOSES TODO-005). Same 160-acre parcel later sold by Connell and Rebecca to Willard V. Way, Mar 1853 (PR-019/PR-020/PR-021). Felix Boyle (Sr.) as witness connects him to Washington County in July 1845. Unrelated deeds also on pages: James Brun & Hannah Brownson acknowledgment (Hancock County OH, 1 Jun 1842); Peter Schene→Mary Barbara Scheme, 80 acres, Portage Township, Wood County OH, $250, 17 Nov 1845.

BATCH: SRCH-002'
);

-- PR-031
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-031',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    33,
    '1885',
    'Deed (late title chain recital referencing Boyle transactions)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1885–1886; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJS-Q8KJ?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Late deed (ca. 1885–1886) reciting the full title history of the Lock No.4/Romania Farm coal properties now held by Kerr & Gillespie. Primarily useful for confirming and extending the transaction chain. KEY NEW: (1) Scrivener writes ''Conrad (or Connell) Boyle'' — the name uncertainty in the original 1853 handwriting explains why ''Conrad'' OCR variants appear throughout the ledger; (2) Deed Book L Vol.3 p.517 confirmed for the 28-acre Boyle surface tract deed — consistent with PR-009; (3) Deed Book L Vol.3 p.519 cited for coal deed — CONFLICTS with PR-024''s p.219; the 519 vs 219 discrepancy between two later deeds referencing the same 1853 instrument remains unresolved; (4) Dutton Shannon→Fitzsimmons coal deed (14 Aug 1853, Book M Vol.3 p.269) — Shannon sold adjacent coal to Fitzsimmons the same year as the Boyles, confirming coordinated Lock No.4 coal assembly; (5) Simon Wilson''s heirs appear in 1864 (Simon was a frequent adjacent-landowner boundary marker in Boyle deeds); (6) Newton Vanvoorhis confirmed as neighbor — connects to Daniel Vanvoorhis will (WL-001 area). 8 acres 62 perches coal exclusion again confirmed. OCR: ''Monougahela''/''Monongdhela'' = Monongahela; ''straturn'' = stratum; ''Vanvoothins'' = Vanvoorhis.

DATES: This deed: ca. 1885–1886 (deed book dates). Transactions recited: Boyle→Fitzsimmons 14 May 1853; Shannon→Fitzsimmons 14 Aug 1853; Taylor→Wilson 1860; Wilson→Kerr & Gillespie 26 May 1864.

NAMES: ''Conrad (or Connell) Boyle'' — scrivener uncertain of first name, wrote both; explains ''Conrad'' OCR variants throughout ledger. ''Cown Boule'' and ''Dolin Boule'' = John Boyle (OCR). David Fitzsimmons and John H./A. Fitzsimmons (middle initial inconsistent). Dutton Shannon & wife (adjacent coal seller to Fitzsimmons, Aug 1853). John Wilson (intermediate owner, Wilson/Taylor tracts). Simon Wilson dec. and heirs (adjacent landowner — appeared in Boyle metes-and-bounds; heirs conveyed to John Wilson 1864). Josiah Taylor & wife; Joseph Taylor (coal sellers to Wilson 1860). James Gillespie and Patrick Kerr (ultimate grantees). Newton Vanvoorhis (neighbor).

LOCATIONS: Fallowfield Township, Washington County PA. Romania Farm coal (Boyle parcel); 28-acre river tract at Lock No.4; Dutton Shannon farm (156 ac. 3 roods 8 perches); Wilson/Taylor tracts (412 ac. 106 perches total — 100 ac. + 20 ac. 80 perches + remainder). Neighbors: Simon Wilson (dec.), Newton Vanvoorhis (= Vanvoothins OCR), Dutton Shannon, William Crawford, William Galbraith, Colvin heirs, West Frye, Samuel Jones, Rezin Frye, John Conrad, Edward Crawford.

CITED RECORDS: Boyle coal deed cited as Deed Book L Vol.3 p.519 (CONFLICTS with PR-024 which cited p.219 — discrepancy unresolved; two later deeds give different page numbers for the same 1853 instrument). Boyle 28-acre surface tract cited as Deed Book L Vol.3 p.517 (NEW — first explicit confirmation; consistent with PR-009''s listing). Dutton Shannon→Fitzsimmons coal deed: 14 Aug 1853, Book M Vol.3 p.269 (NEW). Wilson tracts: Simon Wilson heirs→John Wilson quitclaim, 25 Apr 1864; Josiah Taylor & wife→John Wilson, 14 Sep 1860, Deed Book Vol.3 p.588; Joseph Taylor→John Wilson, 3 Mar 1860, Deed Book H Vol.3 p.586; John Wilson→Kerr & Gillespie, 26 May 1864, Deed Book D Vol.4 p.459.

BATCH: SRCH-002'
);

-- PR-032
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-032',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    34,
    '1853',
    'Deed (surface tract, 28 acres, Boyle→Fitzsimmons, Deed Book L Vol.3 p.517)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QJ1?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CWashington&searchForm=advanced&lang=en',
    'Source deed for the 28-acre surface tract at Lock No.4 conveyed by Connell Boyle and Rebecca his wife to David and John A. Fitzsimmons, May 14, 1853, $947.90 consideration. This is Deed Book L Vol.3 p.517, referenced throughout the ledger. RESOLVES CONSIDERATION DISCREPANCY: the $947.90 receipt seen in PR-014/PR-016 belongs to THIS deed (surface tract), not the coal deed (p.519, $8,020.85). The Fitzsimmons transaction on May 14, 1853 was actually two separate deeds: p.517 ($947.90 surface) and p.519 ($8,020.85 coal). NEW: Thomas Fry deed reference confirmed — Book Y Vol.9 p.35, 28 Dec 1838. Fry sold this river tract to the Boyles the same year as the McMillan deed and Connell''s marriage to Rebecca. WAGON ROAD RESERVATION: Connell and Rebecca explicitly reserved the perpetual right to make and use a wagon road from this lot to their farm — selling the river frontage but protecting access from remaining land. Roswell Marsh/Williams reference Book No. Vol.2 p.65 varies slightly from PR-014/PR-018''s Book H Vol.3 p.65 — OCR variation or genuinely different instrument. Connell and Rebecca''s 1853 residence confirmed as Fallowfield Township. Pages 517–518 of deed book. Rice''s Run appears as geographic reference at beginning point. OCR: ''Sock No 4'' = Lock No.4; ''Monongahers Foregard'' = Monongahela River; ''Regan'' = Rice''s Run; ''heyres'' = heirs or John Boyle.

DATES: Deed: 14 May 1853. Recorded: 19 May 1853 by F.C. Morrison (consistent with p.517 recording date from PR-009).

NAMES: Connell Boyle and Rebecca his wife (grantors, Fallowfield Township); David Fitzsimmons and John A. Fitzsimmons (grantees, City of Allegheny). Prior grantors: Thomas Fry (28 Dec 1838, Book Y Vol.9 p.35 — NEW); Roswell Marsh admin. John Williams (1850, Book No. Vol.2 p.65). Reservation: Connell Boyle and Rebecca reserved perpetual wagon road right from this lot to their farm. F.C. Morrison (Recorder).

LOCATIONS: Fallowfield Township, Washington County PA. 28 acres 2 rods 31 perches near Lock No.4, Monongahela River. Beginning at beech tree at forks of Rice''s Run; full metes and bounds on pp.517–518. Bounded N by James O''Hara''s land, E by Monongahela River, S by Thomas Fry''s land, W by coal tract. Grantors resident: Fallowfield Township (confirmed for 1853).

CITED RECORDS: Title chain: (1) Thomas Fry→Connell & John Boyle, 28 Dec 1838, Book Y Vol.9 p.35 (NEW — first book/page reference for Fry deed); (2) Roswell Marsh admin. John Williams→Connell & [John Boyle/heirs], 1850, Book No. Vol.2 p.65 (SLIGHT DISCREPANCY with PR-014/PR-018 which cited Book H Vol.3 p.65 — OCR variation or different parcel). Resolves consideration discrepancy: $947.90 is for THIS 28-acre surface tract deed (p.517), NOT the coal deed (p.519, $8,020.85). Preceding deed on same pages: John Patterson→Elliott Patterson, acknowledged 2 Mar 1844, recorded 19 May 1853 by F.C. Morrison (unrelated).

BATCH: SRCH-002'
);

-- PR-033
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-033',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    35,
    '1837',
    'Agreement (1837) + Deed (Roswell Marsh→Boyle brothers, Feb 1850) — source documents for Williams estate conveyance',
    'Washington County',
    'PA',
    'Washington. Deeds 1850–1851; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9T89?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Two instruments on same pages: (1) AGREEMENT dated 15 Dec 1837 between John Williams of Brook County VA and C.&J. Boyle for 92 acres 2 roods in Fallowfield Township, $1,840 in three installments through November 1839 — EARLIEST DOCUMENTED BOYLE LAND TRANSACTION, predating the McMillan deed (Oct 1838), the Fry deed (Dec 1838), and the marriage to Rebecca (1838); Connell was making land deals from at least age 35. (2) DEED from Roswell Marsh as administrator of John Williams estate (now deceased) to Connell and John Boyle, February 1850, recorded 27 Feb 1850 — the SOURCE DEED for the Williams estate entry in the Romania Farm title chain (PR-014/PR-018). RESOLVES DATE DISCREPANCY: PR-028 cited ''27 Feb 1840'' for this deed — confirmed as 1850; the 13-year gap between agreement (1837) and deed (1850) is explained by John Williams dying before executing the deed, requiring Marsh as administrator to complete the transaction. FIRST DIRECT EVIDENCE of Felix Boyle Sr. as a Fallowfield Township landowner: ''Felix Boyls'' appears as an adjacent landowner in the metes and bounds, directly next to where the brothers were building the Romania Farm cluster. Williams land formerly belonged to Robert Williams dec., decreed to John Williams by Orphans Court 24 Oct 1837 (two months before the Boyle agreement — John Williams was selling land he''d just inherited). John Williams was from Brook County (now Brooke County, WV), Virginia. Total price $1,840; metes and bounds begin at Monongahela River bank, confirming river frontage on this parcel too. OCR: ''Monongshels'' = Monongahela; ''Felix Boyls'' = Felix Boyle; ''H. J. Boyle'' = J[ohn] Boyle; ''Thomas Free'' = Thomas Fry.

DATES: Agreement: 15 Dec 1837. Payment schedule: $613.33 each on 1 Apr 1838, 1 Nov 1838, 1 Nov 1839 (total $1,840). Deed (Marsh→Boyles): February 1850. Proven in Court of Common Pleas and recorded: 27 Feb 1850 by F.C. Morrison.

NAMES: John Williams (seller, Brook County VA — died before executing deed); Robert Williams dec. (prior owner; John Williams received via Orphans Court 24 Oct 1837); Connell Boyle and John Boyle (purchasers — OCR: ''C. Boyle,'' ''H. J. Boyle,'' ''C. & J. Boyle'' — all = Connell and John). Roswell Marsh (administrator, John Williams estate — executed deed Feb 1850). Thomas Officer (witness to 1837 agreement; later deposed to his own handwriting 27 Feb 1850). James Brown (Prothonotary, Court of Common Pleas, Washington Co.). F.C. Morrison (Recorder). FELIX BOYLE cited as adjacent landowner (''Felix Boyls'') — Felix Boyle Sr. (1813–1884) owned land adjoining this Fallowfield Township parcel.

LOCATIONS: Fallowfield Township, Washington County PA. 92 acres 2 roods. Beginning at sugar tree on Monongahela River bank; neighbors: Felix Boyle (ADJACENT LANDOWNER — first direct evidence of Felix Sr. as Fallowfield Township property owner), Thomas Fry/Free, Abraham Frye, James Rice, William Crawford. Metes and bounds begin at Monongahela River, confirming river frontage.

CITED RECORDS: Agreement: John Williams & C.&J. Boyle, 15 Dec 1837 (EARLIEST DOCUMENTED BOYLE TRANSACTION). Deed: Roswell Marsh admin.→Connell & John Boyle, February 1850 (recorded 27 Feb 1850 by F.C. Morrison, pages 64–65). RESOLVES DATE DISCREPANCY: PR-028 cited ''27 Feb 1840'' for this deed — confirmed as February 1850; ''1840'' is OCR error for ''1850.'' Williams land formerly owned by Robert Williams dec., decreed to John Williams by Orphans Court of Washington County, 24 Oct 1837 (two months before the Boyle agreement). John Williams was from Brook County (now Brooke County, WV), Virginia. Other instruments on same pages: Anna Armstrong & Jane Armstrong→James Walker acknowledgment (15 May 1849, $4,401.50); Joseph Hamilton→Michael Rose, town lots in Carnell Township (31 May 1848, $150); both unrelated.

BATCH: SRCH-002'
);

-- PR-034
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-034',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    36,
    '1853',
    'Deed (near-duplicate of PR-032, image 646 vs 645, marginally different OCR on deed book references)',
    NULL,
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QYV?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CWashington&searchForm=advanced&lang=en',
    'Adjacent image (646) of the same deed book pages as PR-032 (image 645). Same Boyle→Fitzsimmons 28-acre surface tract deed, 14 May 1853. Only difference is OCR variation on the cited deed book references. No new substantive information.

DATES: Same as PR-032. Deed: 14 May 1853. Recorded: 19 May 1853.

NAMES: Same as PR-032. Connell Boyle, Rebecca his wife, John Boyle (grantors); David Fitzimons and John A. Fitzimons (grantees).

LOCATIONS: Same as PR-032. Fallowfield Township, 28 acres 2 rods 31 perches near Lock No.4, Monongahela River.

CITED RECORDS: Duplicate of PR-032 (image 645). Same deed, pages 517–518. Book references OCR slightly differently: Fry deed ''Book Y Vol.2 p.35'' (PR-032: Vol.9); Williams/Marsh deed ''Book H Vol.2 p.65'' (PR-032: ''Book No. Vol.2''; PR-014: ''Book H Vol.3''). Consistent anchors: Book Y p.35 (Fry) and Book H p.65 (Williams). Volume numbers are the OCR variable.

BATCH: SRCH-002'
);

-- PR-035
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-035',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    37,
    '1864',
    'Deed (surface only, coal reserved, Rabe→Felix Boyle Jr.)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9RGP?view=fullText&keywords=Connell+Boyle%2CWashington%2CPennsylvania&searchForm=advanced&lang=en',
    'Hiram Rabe and Catharine his wife convey 67 acres of Carroll Township surface land to Felix Boyle Jr. for $3,350, April 6, 1864. SIGNIFICANT: (1) Felix Boyle Jr. (Captain Felix, age ~25) is establishing his own land holding in the same Carroll Township neighborhood where his father Connell operated, during the Civil War — raises question of his military status in April 1864 (discharged? on leave?); (2) ''Heirs of Connell Boyle decd'' cited as adjacent landowner — confirms Connell died before April 1864 (consistent with 1861) and his estate still held Carroll Township land three years later; (3) Coal reserved by Rabe — surface sold, coal retained, consistent with prevailing pattern in the neighborhood by 1864; (4) $3,350 for 67 surface acres (~$50/acre) is substantial — source of Felix Jr.''s capital at age 25 unknown (pre-dates whiskey distillery failure by 20 years); (5) Grant family dominates the neighborhood boundaries — Noah Grant, Robert Grant, Ely Grant, David Grant heirs all adjacent; (6) Thomas Collins as J.P. — same man who acknowledged Connell→John Boyle deed (PR-022) nine years earlier; (7) J.P. King as new Recorder — Cyrus Underwood''s successor. OCR: ''Felix Begle Jr.'' = Felix Boyle Jr.; ''Hiram Clabe'' = Hiram Rabe; ''Catharine Malabe'' = Catharine Rabe.

DATES: Deed: 6 Apr 1864. Acknowledged: 1 Apr 1864 before Thomas Collins J.P. (date precedes deed — possible error). Recorded: 27 Aug 1864 by J.P. King (Recorder — successor to Cyrus Underwood).

NAMES: Hiram Rabe and Catharine his wife (grantors); Felix Boyle [Jr.] (grantee — deed heading: ''Felix Begle Jr.''; body: ''Felix Boyle'' — almost certainly Captain Felix Boyle, 1839–1916, age 25 in Apr 1864; ''Jr.'' distinguishes from uncle Felix Sr.). Andrew Brun (prior trustee, court-appointed). Witnesses: S. Dickson; Thomas Collins (also J.P. — same Collins as PR-022, 1855). Recorder: J.P. King (successor to Cyrus Underwood).

LOCATIONS: Carroll Township, Washington County PA. 67 acres surface only (coal reserved by Rabe). Neighbors: William Wickerham, Robert Grant, Noah Grant, Ely Grant, David Grant heirs, HEIRS OF CONNELL BOYLE DEC''D (adjacent — estate still holding land 1864). Beginning at stone on sugar tree stump.

CITED RECORDS: ''Heirs of Connell Boyle decd'' cited as adjacent landowner — Connell''s estate still holding land in Carroll Township, April 1864, three years after his death. Prior title: George & Elizabeth Grant→Hiram Rabe via Andrew Brun as court-appointed Trustee, 31 Jan [185]7, recorded 22 Feb 1859, Book V Vol.3 pp.149–150. Unrelated deed also on pages: John Coburn M.D. & Mary M. Coburn→Dr. John Weaver, 30 May 1863, house and lots in Candor, Washington Co. PA, $1,200.

BATCH: SRCH-002'
);

-- PR-036
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-036',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    38,
    '1852',
    'Two simultaneous deeds — family partition of Philemon Boyle''s farm (surface vs. coal rights)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QFY?view=fullText&keywords=Connell+Boyle%2CWashington&searchForm=advanced&lang=en',
    'TWO SIMULTANEOUS DEEDS, October 28, 1852, partitioning the farm of the late Philemon Boyle among his heirs. DEED 1: Alice Boyle, Mariah Boyle, Felix Boyle (Sr.), and Alice Crosby née Boyle convey coal privileges under the 123.5-acre farm to Connell and John Boyle for $1 nominal. DEED 2: Connell Boyle, Rebecca his wife, and John Boyle convey their 2/7ths interest in the farm surface to Alice, Mariah, Felix, and Alice Crosby for $1 nominal. Result: Connell and John get all coal rights; the four other siblings get the surface land. MAJOR DISCOVERIES: (1) PHILEMON BOYLE named directly — ''Philemon Boyle decd'' = Phelim/Felix P. Boyle the immigrant patriarch, FIRST DIRECT NAMING in Washington County deed; (2) THREE PREVIOUSLY UNKNOWN SISTERS OF CONNELL: Alice Boyle, Mariah Boyle, and Alice Crosby née Boyle; (3) RESOLVES PR-018 COAL DEED TITLE CHAIN: ''Felix Boyle''s heirs→Connell and John Boyle, coal privileges, 28 Oct 1852, recorded 25 Apr 1853'' in Romania Farm title chain = THIS deed; ''Felix Boyle'' there = Felix P./Phelim/Philemon Boyle the patriarch, his heirs being the four sibling grantors; (4) Philemon''s farm was conveyed to him from [Rice family?] in 1840 and recorded Book [_] No.2 pp.156–157 — he acquired this farm one year before his death; (5) The coal rights obtained from these siblings in Oct 1852 were then conveyed to Fitzsimmons in May 1853 as part of the Romania Farm coal package; (6) Ira R. Butler as witness to Felix Sr.''s signature and J.P. for his acknowledgment — Butler was evidently trusted by ALL branches of the Boyle family. OCR throughout renders ''Connell'' as ''Collin/Collins/Corn''; ''Philemon'' as ''Philimon/Philimon Bail''; ''Boyle'' as ''Bail/Baile/Boil/Bois'' consistently.

DATES: Both deeds: 28 Oct 1852. Felix Boyle''s acknowledgment: 29 Oct 1852 before Ira R. Butler J.P. Connell, Rebecca, and John''s acknowledgment: 28 Oct 1852 before associate judge [Vot Human?/OCR]. Recorded: 25 Apr 1853 by F.C. Morrison.

NAMES: DEED 1 (coal privileges, heirs→Connell & John): Alice Boyle (grantor, Connell''s sister — NEW); Mariah Boyle (grantor, Connell''s sister — NEW); Felix Boyle (grantor = Felix Sr., Connell''s brother); Alice Crosby née Boyle (grantor, Connell''s sister, married Crosby — NEW); Connell Boyle and John Boyle (grantees). DEED 2 (surface 2/7ths, Connell & John→heirs): Connell Boyle (grantor, OCR: ''Collin/Collins Boyle''); Rebecca his wife (grantor); John Boyle (grantor); Alice Boyle, Mariah Boyle, Felix Boyle, Alice Crosby (grantees). PHILEMON BOYLE dec. (patriarch = Phelim/Felix P. Boyle the immigrant — FIRST DIRECT NAMING in Washington County deed). Ira R. Butler (witness to Felix Boyle''s signature and J.P. for his acknowledgment). John Freeman; Elizabeth Freeman (witnesses). F.C. Morrison (Recorder).

LOCATIONS: Fallowfield Township, Washington County PA. 123.5 acres, farm formerly owned by Philemon Boyle dec. Neighbors: Abraham F. Snap/Swap (= Snapp?), Robert Williams, William Crawford, Alexander George, James Rice (probable prior grantor). Beginning at white oak.

CITED RECORDS: RESOLVES PR-018 MYSTERY: ''Felix Boyle''s heirs→Connell and John Boyle, coal privileges, 28 Oct 1852, Book L Vol.3 pp.426–427'' in coal deed title chain = THIS deed. ''Felix Boyle'' in that title chain = Felix P./Phelim/Philemon Boyle the patriarch, and his heirs are the grantors here. Recorded April 25, 1853 (matches PR-018 exactly). Philemon''s farm reference: ''book St Not 2nd pages 136 & 157'' (OCR for Book [_] No.2 pp.156–157) — Philemon''s own deed recorded there. Farm acquired by Philemon from [Rice?] in 1840, one year before his death.

BATCH: SRCH-002'
);

-- PR-037
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-037',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    39,
    '1854',
    'Deed (coal and shale rights, Sampson→Boyle brothers, $9,085.34)',
    'Washington County',
    'PA',
    'Washington. Deeds 1853–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-C99X-5?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Source deed for the Sampson→Boyle coal conveyance cited in PR-015. James and Mary Sampson convey coal AND shale rights plus mining privileges under ~382 acres 84 perches in Carroll Township to John and Connell Boyle for $9,085.34, May 13, 1854. SIGNIFICANT: (1) Consideration is $9,085.34 — much larger than assumed; combined with Rape deed ($1,000) = ~$10,085 paid for coal rights immediately pledged to Moorhead for $20,042.40 (MG-001/PR-026/PR-027); Moorhead capturing substantial margin; (2) SHALE included alongside coal — ''coal and shale'' rights, not coal only; (3) ''C. & J. Boyle'' referenced in metes-and-bounds entry point description — their own land cited as navigation reference in the deed; (4) Per MG-001, Sampson was likely paid via assignment of Moorhead''s mortgage payments rather than cash — the chain of IOUs running: Sampson sells coal→Boyles assign Moorhead paper to Sampson as payment; (5) Ira R. Butler as witness and J.P. again; Henry Beland as co-witness (new name). OCR: ''John Connell & John Connell Boyle'' = John Boyle and Connell Boyle; ''324 acres'' = 382 acres (OCR); ''$39085.34'' in receipt = $9,085.34.

DATES: Deed: 13 May 1854. Recorded by F.C. Morrison (date not fully legible in OCR).

NAMES: James Sampson (grantor); Mary Sampson his wife (grantor, separately examined); John Boyle and Connell Boyle (grantees — OCR garbles as ''John Connell & John Connell Boyle''). Witnesses: Ira R. Butler (also J.P.); Henry Beland. Recorder: F.C. Morrison.

LOCATIONS: Carroll Township, Washington County PA. Coal and shale under ~382 acres 84 perches (OCR: ''324 acres 84 perches''). Neighbors: Robert Grant, D.G. Rape, Thomas Doyle (Doyle''s lot), C.&J. Boyle property (referenced in entry point description).

CITED RECORDS: This is the source deed cited in PR-015 as ''James Campson and Mary his wife conveyed to said John Boyle & Connell Boyle, 13 May 1854.'' Consistent with MG-001: Boyles assigned Moorhead mortgage payments to Sampson same day — Sampson likely paid via paper assignment rather than cash. Neighbors confirmed: Robert Grant, D.G. Rape (same as PR-015 third tract). Entry points reference ''C. & J. Boyle'' land. Acreage: 324 acres 84 perches (OCR; PR-015 gave 382 acres 84 perches — ''3_2'' vs ''3_4'' OCR variation; 382 likely correct).

BATCH: SRCH-002'
);

-- PR-038
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-038',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    40,
    '1852',
    'Deed (preceding page to PR-036, Philemon Boyle farm coal partition, two veins)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QN5?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Image 597 — preceding page to PR-036 (image 598). Beginning of what is almost certainly the same coal partition deed (or a closely related supplemental deed) between the same Boyle siblings for the same Philemon Boyle farm. Property description specifies ''two veins or Strates of coal under said farm'' — either this opening page covers both coal seams while PR-036''s continuation focused on one, or this is a separate but related instrument conveying additional coal rights. Date reads ''1862'' in OCR but is almost certainly ''1852'' — Connell Boyle died in 1861 and a deed conveying TO Connell in 1862 is chronologically impossible. Same parties and $1 nominal consideration as PR-036. OCR renders ''Connell Boyle'' as ''Collis Baile'' and ''John Boyle'' as ''John Burt'' — same garbling pattern throughout this family''s records.

DATES: Almost certainly October 28, 1852 (same date as PR-036; ''1862'' is OCR error for ''1852''). Month illegible in OCR.

NAMES: Alice [While/Boyle] (grantor = Alice Boyle, Connell''s sister); Mina [Pail/Boyle] (grantor = Mariah Boyle, Connell''s sister); Felix [Bail/Boyle] (grantor = Felix Boyle Sr.); [Crosby] (grantor = Alice Crosby née Boyle); Connell Boyle (grantee — OCR: ''Collis Baile''); John Boyle (grantee — OCR: ''John Burt''). $1 nominal consideration.

LOCATIONS: Fallowfield Township, Washington County PA. Philemon Boyle farm, same 123.5 acres as PR-036. Subject: two coal veins or strata under the farm (PR-036 referenced one; this may cover additional seams or be the same deed''s opening pages).

CITED RECORDS: Preceding page (image 597) to PR-036 (image 598). Probably same deed or closely related supplemental instrument — same parties, same farm, same nominal $1 consideration. ''1862'' in date is almost certainly OCR error for ''1852'' (Connell died 1861; a deed TO Connell in 1862 makes no sense). Unrelated deeds also on pages: Thomas D. Scott & Nancy Scott acknowledgment, Jefferson County OH, 12 Feb 1853 (Ohio deed recorded in Washington Co.); Abraham Riggle & Catharine→Joseph Hewitt, Bethlehem Township, 28 Mar 1851, $600.

BATCH: SRCH-002'
);

-- PR-039
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-039',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    41,
    '1855',
    'Deed (Moorhead→Shaler/Stanton/Wimbstetter trust, 7 Jun 1855, beginning page)',
    'Washington County',
    'PA',
    'Washington. Deeds 1857–1858; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-S39J?view=fullText&keywords=Connell+Boyle%2Cunited+States%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'James Kennedy Moorhead conveys the Carroll/Fallowfield Township Boyle property package to Charles Shaler, Edwin M. Stanton, and Theobald Wimbstetter of Pittsburgh, June 7, 1855. REMARKABLE CONNECTION: Edwin M. Stanton (1814–1869) was at this time a prominent Pittsburgh attorney; he later became Lincoln''s Secretary of War (1862–1867). Charles Shaler was a well-known Pittsburgh jurist. These are high-powered Pittsburgh legal figures, almost certainly named as trustees rather than outright buyers — this is almost certainly the ''trust deed creating certain trusts and for other purposes'' referenced in PR-015 as Moorhead''s June 7, 1855 deed at Book Vol.3 p.139. The Boyle property was placed in a formal legal trust managed by Pittsburgh''s legal elite. Deed recites Boyle→Moorhead consideration as $20,042.40, confirming PR-026/PR-027. Boyle→Moorhead deed cited at Book N p.339 (matches all prior references). Property description truncated — continuation page needed. OCR note: deed date cited as ''1844'' for ''1854'' is OCR error; ''1897'' for ''1857'' appears in Bentley acknowledgment (same digit transposition pattern). Carolyn observation: AI summaries consistently miss Boyle content when it appears as the second deed on a page.

DATES: This deed: 7 Jun 1855. Boyle→Moorhead deed cited as ''13 May 1844'' — OCR error for ''13 May 1854.''

NAMES: James Kennedy Moorhead (grantor — OCR: ''Kennady Moorhead,'' ''J. Hundy Moorhead''); Charles Shaler (grantee — prominent Pittsburgh attorney/jurist); Edwin M. Stanton (grantee — Pittsburgh attorney, later Lincoln''s Secretary of War 1862–1867); Theobald Wimbstetter (grantee — OCR: ''Wimbstetter/Webstetter''). Prior parties recited: John Boyle, Connell Boyle, Rebecca A. Boyle (original grantors to Moorhead, 13 May 1854).

LOCATIONS: Carroll Township and Fallowfield Township, Washington County PA (property description truncated — continuation page needed for full description).

CITED RECORDS: Recites Boyle→Moorhead deed: ''thirteenth day of May Anno Domini Eighteen hundred and forty four'' (OCR error for 1854) in Book N pages 339 &c, $20,042.40 — matches PR-026/PR-027 exactly. This deed (Moorhead→Shaler/Stanton/Wimbstetter, 7 Jun 1855) is probably the ''trust deed'' creating certain trusts referenced in PR-015 as Book Vol.3 p.139, rather than a deed back to the Boyles. Unrelated deed also on pages: Shesh Bentley Jr. & Elizabeth Bentley→Benjamin F. Bentley, 28 Sep 1857, lot on Ferry Street, Monongahela City, $800 (title through sheriff''s sale of Williams Mills property, 28 May 1844, Seth Bently purchaser).

BATCH: SRCH-002'
);

-- MG-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'MG-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'MG'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    43,
    '1841',
    'Mortgage (Connell & John Boyle→Isaac Lightner, $2,747, 1841)',
    'Washington County',
    'PA',
    'Washington. Mortgages 1841–1854; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QHV-V38P-N9ZB-Q?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Connell and John Boyle mortgage their property portfolio to Isaac Lightner (Pittsburgh, executor of Charles Bollman estate) for $2,747, July 1841. REVEALS FULL 1841 PROPERTY SCOPE: (1) Carroll Township river parcel from 1833 Samuel Davis deed (Book I No.2 pp.379–380 — confirmed book/page for PR-029); (2) 50-acre adjoining parcel via Dobbs→Davis (1836) then Davis→Boyles (31 Mar 1841) — SECOND Samuel Davis deed, different from 1833; (3) TOWN OF COLUMBIA LOTS — NEW: house lots 22, 35, 37, 38, 39 and part of additional lots, plus one 2-acre out-lot in Town of Columbia, Washington County PA. Urban/town property not previously documented. The Boyles were already in mortgage debt by 1841 — three years into the marriage, eight years into the operation. Isaac Lightner as Pittsburgh creditor (executor of Bollman estate) is another Pittsburgh financial connection predating Moorhead. Dobbs→Davis chain for the 50-acre parcel: John Dobbs & Mary→Davis, 14 Oct 1836, Book I Vol.2 pp.355–357. Heirs of William Sampson appear as neighbors (new — predating James Sampson as grantor in 1854). OCR: acknowledgment date ''1861'' = 1841; recording date ''1840'' = 1841; ''Connell B'' in acknowledgment = Connell Boyle.

DATES: Mortgage: acknowledged 12 Jul 1841 (OCR: ''1861'' — error); recorded 22 Aug 1841 (OCR: ''1840'' — error). Davis→Boyles second deed: 31 Mar 1841.

NAMES: Connell Boyle (mortgagor); John Boyle (mortgagor); Isaac Lightner of Pittsburgh (mortgagee — executor of Charles Bollman estate, Monongahela City). Prior grantors: Samuel Davis & Elizabeth Davis (1833 and 1841 deeds); John Dobbs & Mary Dobbs (1836→Davis). Witnesses: Alfred Thirkield; John Doyle. J.P.: John Clement.

LOCATIONS: Carroll Township, Washington County PA (1833 Davis parcel, river frontage, bounded by Robert Grant''s former land and Monongahela); 50-acre parcel adjoining (1841 Davis, via Dobbs 1836); Town of Columbia, Washington County PA — NEW: house lots 22, 35, 37, 38, 39, part of additional lots, and one out-lot of ~2 acres. Neighbors: heirs of William Sampson (new); Robert Grant (former land).

CITED RECORDS: Title chain recited: (1) Davis→Boyles, 1833, Book I No.2 pp.379–380 (= Samuel Davis deed from PR-029, confirmed book/page reference); (2) John Dobbs & Mary→Samuel Davis, 14 Oct 1836, Book I Vol.2 pp.355–357; (3) Samuel Davis & Elizabeth→Connell & John Boyles, 31 Mar 1841 (SECOND Davis deed, different from 1833). Unrelated mortgage on same pages: Samuel Devor→Isaac Lightner (executor, Charles Bollman estate), lots 141 & 142 Monongahela City, $2,000, 30 Jul 1841.

BATCH: SRCH-002'
);

-- PR-040
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-040',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    44,
    '1863',
    'Deed (Wallace estate→McClean, title chain recital)',
    'Washington County',
    'PA',
    'Washington. Deeds 1863–1864; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-9RLH?view=fullText&keywords=Connell+Boyle%2CWashington&searchForm=advanced&lang=en',
    'Title chain recital deed confirming Wallace estate→Samuel McClean consideration: $7,500. COMPLETES THE VALUE CHAIN: Boyles assembled and sold coal rights to Fitzsimmons ($8,020 + $947 surface); Fitzsimmons→Wallace 28 Jun 1856 (consideration unknown); Wallace estate→McClean $7,500 (distressed estate sale); McClean→Kerr & Gillespie $21,400 (PR-024). McClean paid $7,500 for estate property and sold for nearly three times that within roughly a year — the final extraction of value from what the Boyles built. Wrong year error propagating: Boyle→Fitzsimmons deed cited as ''14 May 1855'' and ''1885'' throughout — original scrivener error copied by every subsequent deed in the chain. Book Vol.3 p.519 cited for coal deed (vs p.219 in PR-024 — discrepancy unresolved). Monongahela Cemetery incorporation petition on same pages includes James Sampson among petitioners — the same Sampson family who sold coal rights to the Boyles in 1854 and whose brother Harry''s will Connell witnessed in 1849, now founding community institutions. Neighbor names OCR''d as ''James O''Stana'' = James O''Hara; ''Thomas Day'' = Thomas Fry.

DATES: Wallace estate→McClean deed: acknowledged 4 [month] 1863/1864 before Alderman A.S. Nicholson, Pittsburgh; recorded [Oct?] 20, 1867 by M.H. How, Recorder.

NAMES: William P. Banne/Barns/Banner (administrator, Thomas Wallace estate); Samuel McClain/Clark C. (grantee, $7,500 — same Samuel McClean as PR-024). Prior parties: Connell Boyle & wife, John Boyle (original 1853 grantors); David Fitzsimmons & wife, John A. Fitzsimmons (1856 Wallace grantors); Thomas Wallace dec. Witnesses: A.S. Nicholson (also Alderman, Pittsburgh); W.S. Nicholson. Recorder: M.H. How.

LOCATIONS: Fallowfield Township and Carroll Township, Washington County PA. Romania Farm coal and 28-acre surface tract at Lock No.4. Same aggregate 420 acres as PR-024.

CITED RECORDS: Title chain recited: Boyle→Fitzsimmons 14 May 1853 (cited here as ''1855'' and ''1885'' — OCR/scrivener error propagating through chain); Book Vol.3 p.519 for coal deed (vs p.219 in PR-024 — discrepancy persists); Fitzsimmons→Wallace 28 Jun 1856 (confirmed again); Wallace estate→McClean $7,500 (this deed). Dutton Shannon coal deed cited: Book ''N'' 3rd page 269, 14 Aug 1853. Monongahela Cemetery incorporation petition on same pages: signatories include James Sampson (same Sampson family), Shesh Bentley (from PR-039 adjacent deed), J.R. Hazzard, H.L.S. Wilson, Joseph Wilson, R.S. Cooper, James Williams et al.

BATCH: SRCH-002'
);

-- PR-041
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-041',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    45,
    '1860',
    'Deed (neighboring property, Boyle estate cited as boundary marker)',
    'Washington County',
    'PA',
    'Washington. Deeds 1860–1861; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-9SMX-H?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CUnited+states%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Neighboring property deed, not a Boyle transaction. Significant because ''Connell Boyle''s Estate'' appears in metes and bounds as adjacent landowner, November 1860. CONFIRMS CONNELL DECEASED BEFORE NOVEMBER 1860 — pushes death date earlier than previously assumed 1861. ''Robert Grant''s Estate'' also cited as deceased neighbor. Boyle estate land still held in Carroll Township at this date, adjacent to Wickersham and Rabe holdings. David S. Raber = Rabe family (Hiram Rabe who sold 67 acres to Captain Felix in 1864, PR-035) — the neighborhood is consistent. Thomas Collins as J.P. — same Collins who acknowledged multiple Boyle deeds 1855–1864, still active in 1860. Freeman Brady Jr. as new Recorder, successor to J.P. King.

DATES: Wickersham deed acknowledged: 26 Nov 1860. Recorded: 28 Nov 1860 by Freeman Brady Jr. (Recorder — successor to J.P. King).

NAMES: William H.H. Wickersham Jr. (grantor, $1 nominal — probably family transfer); William Wickersham Sr. (prior owner). Boundary references: Connell Boyle''s Estate (dec.); Robert Grant''s Estate (dec.); David S. Raber/Rabe; Hiram Rabe. J.P.: Thomas Collins (same Collins as PR-022, PR-023, PR-035). Recorder: Freeman Brady Jr.

LOCATIONS: Carroll Township, Washington County PA. ~40 acres. Boundary cites: David S. Raber (= Rabe family, PR-035); Robert Grant''s Estate (dec.); CONNELL BOYLE''S ESTATE (dec. — adjacent landowner); Hiram Rabe (same Rabe who sold to Captain Felix 1864).

CITED RECORDS: William Wickersham Sr. acquired this tract from Alexander and John Dixon, 12 Dec 1834, Book R Vol.2 pp.308–309. Also references deed of trust from William Wickersham Sr. to John Bausman for William H.H. Wickersham. Unrelated deed: Jonas Amspiker & Mary→Lilburn Shipley, Smith Township, 8 Oct 1859, $3,600.

BATCH: SRCH-002'
);

-- PR-042
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-042',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    46,
    '1853',
    'Agreement conclusion — sworn statement, receipt, and recording (continuation of PR-018)',
    NULL,
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QT2?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Conclusion of the April 27, 1853 Boyle→Fitzsimmons agreement (PR-018). NEW: Total acreage confirmed as 260 acres — ''consideration money in full & the within articles mentioned for 260 Acres according to the above supplement to article.'' John Boyle acting as attorney for both the sworn statement (May 18, 1853) and the recording submission (''By John Boyle Atty'') — Connell again absent, represented by his brother. David Fitzsimmons and John Boyle swore before J.P. George W. Brice that the agreement ''were made in good faith & have been carried out so far as appears by the subsequent agreement.'' Connell Boyle and John Boyle both signed the receipt acknowledging full payment from Fitzsimmons brothers. Both Connell and John appear as witnesses in the agreement''s witness list alongside B. McCaine, Samuel Balsley, and David Simons. J.C. Morrison as Recorder. George W. Brice as J.P. — new name in the Boyle legal circle.

DATES: Sworn statement by Fitzsimmons and John Boyle: 18 May 1853 before George W. Brice J.P. Receipt dated: 18 May 1853. Recorded: 19 May 1853 by J.C. Morrison.

NAMES: David Fitzsimmons and John Boyle (swore before J.P. that agreement made in good faith; John representing ''absent parties'' including Connell); Connell Boyle and John Boyle (signed receipt for full consideration); David Fitzsimmons and John A. Fitzsimmons (paid consideration). Witnesses to agreement: Connell Boyle, B. McCaine, John Boyle, Samuel Balsley, David Simons. J.P.: George W. Brice (new name). Recorder: J.C. Morrison; submitted ''By John Boyle Atty'' — John acting as attorney for recording.

LOCATIONS: Same as PR-018. Carroll/Fallowfield Township, Lock No.4 area.

CITED RECORDS: Conclusion of PR-018 (April 27, 1853 agreement between Connell & John Boyle and Fitzsimmons). Recorded 19 May 1853 by J.C. Morrison. Unrelated deed on same pages: William Grier & Eleanor Ann Grier→Alexander McConnell, Chartiers Township, 7 May 1853, 2 acres 3 rods 20 perches, $150, ''Mull Survey'' tract.

BATCH: SRCH-002'
);

-- EX-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    47,
    '1882',
    'EXCLUDED — different person',
    'Northampton County',
    'PA',
    'Warren. Naturalization Records 1888, 1877; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-99Q4-89W6-J?view=fullText&keywords=Connell+Boyle%2CUnited+States&searchForm=advanced&lang=en',
    'EXCLUDED: Different Connell Boyle. This person arrived from Londonderry April 14, 1882, age 30 (born ca. 1855), declared naturalization intent in Northampton County PA (Easton) October 14, 1885. Our Connell Boyle was born ca. 1802, died before November 1860, and emigrated from Donegal not Derry. Name coincidence only — Connell Boyle was a common enough Irish name to produce duplicates. Almost certainly the same person as the passenger list result also appearing in this Washington County search batch.

DATES: Arrived USA: 14 Apr 1882. Naturalization declaration: 14 Oct 1885.

NAMES: Connell Boyle (age 30 in 1885, born ca. 1855; British subject). NOT our Connell Boyle.

LOCATIONS: Emigrated from Londonderry (Derry), Ireland. Settled Easton, Northampton County PA.

CITED RECORDS: Likely same person as passenger list result in this search batch.

BATCH: SRCH-002'
);

-- PR-043
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-043',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    48,
    '1875',
    'Deed (Boyle heirs→Shanton, Carroll Township surface, $15,360)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1875–1876; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89P7-C?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M9Z4-YLD',
    'Connell Boyle''s heirs sell combined 192-acre Carroll Township surface parcel to John Shanton of Monongahela City for $15,360, March 1875. MAJOR NEW INFORMATION: (1) Book/page references confirmed for PR-025 (Book P Vol.3 p.362) and PR-013 (Book SS Vol.E p.293); (2) NEW DEED: Felix Boyle quitclaim to Zeph M. Boyle & John Boyle Jr., April 18, 1861, Deed Book K Vol.4 p.90 — April 1861 is Fort Sumter month; Captain Felix almost certainly quitclaiming Carroll Township land before enlisting in Civil War; (3) NEW DEED: Felix Boyle→Zeph M. & John Boyle Jr., April 13 [1864?], Deed Book K Vol.4 p.114 — the 67-acre Rabe parcel (PR-035) transferred from Captain Felix to his brothers; both new deeds recorded April 15, 1867 in a batch filing; (4) Rebecca Boyle (Connell''s widow) still alive and signing in 1875 at approximately age 55; (5) Captain Felix Boyle notably ABSENT from this sale — he had already transferred his interest to his brothers; (6) Coal rights still reserved by O''Hara heirs — the reservation from the 1855 O''Hara→Boyle deed (PR-025) carried forward 20 years; (7) James Sampson still adjacent landowner in 1875 — 22 years after the 1853 coal transaction; (8) $15,360 for 192 acres at roughly $80/acre — the Boyle heirs eventually received decent value from the surface land. Surveyors Brisben Wall surveyed the combined tracts March 23–24, 1869 in preparation for sale. OCR: ''Felin Boylet'' = Felix Boyle; ''Zepha M'' = Zeph M. Boyle; ''1899'' for deed date = likely 1864 or 1869; ''1815'' for recording date = 1875.

DATES: Deed: ca. early 1875. Acknowledged: 3 Mar 1875 before Jno. Holland J.P. Recorded: 17 Sep [1875] by S.L. Wilson, Recorder.

NAMES: Zeph M. Boyle (grantor — Connell''s son, = Zephaniah M. Boyle from PR-017); John Boyle Jr. (grantor — Connell''s son); Rebecca Boyle (grantor — Connell''s widow, still alive and signing 1875); Annie McGurgan (grantor — Connell''s daughter, née Boyle); Frank McGurgan her husband (grantor; Annie examined separately). John Shanton of Monongahela City (grantee, $15,360). Captain Felix Boyle ABSENT from this sale. New deeds revealed: Felix Boyle→Zeph M. & John Boyle Jr. (quitclaim Apr 1861 and deed Apr 1864). J.P.: Jno. Holland. Recorder: S.L. Wilson.

LOCATIONS: Carroll Township, Washington County PA. Two tracts surveyed together: (1) 100 acres 102 perches (O''Hara parcel, PR-025, coal reserved by O''Hara heirs, Noah/Elgy Grant passage rights); (2) 67 acres surface (Rabe parcel, PR-035). Total: 192 acres 69 perches surveyed together by Brisben Wall, March 23–24, 1869.

CITED RECORDS: Title chain: (1) James O''Hara & wife→[John Boyle and] Connell Boyle, 20 Mar 1855, Book P Vol.3 p.362, rec. 26 Jun 1855 (= PR-025, book/page now confirmed); (2) John Boyle→[Connell Boyle], 7 Mar 1857, Book SS Vol.E p.293 (= PR-013, book/page now confirmed); (3) NEW: ''Felin Boylet''/Felix Boyle→Zeph M. Boyle & John Boyle Jr., quitclaim, 18 Apr 1861, Deed Book K Vol.4 p.90, rec. 15 Apr 1867 (April 1861 = Fort Sumter month; Captain Felix likely quitclaiming before Civil War service); (4) NEW: Felix Boyle→Zeph M. Boyle & John Boyle Jr., 13 Apr [1864?], Deed Book K Vol.4 p.114, rec. 15 Apr 1867 (= 67-acre Rabe parcel from PR-035, transferred to brothers). Both new deeds recorded same day (15 Apr 1867) despite different execution dates — batch filing. Coal reserved: James O''Hara/C. Hara heirs. Surface passage: Noah and Elgy Grant rights. Adjacent: James Sampson (still there 1875), William Wickersham, Robert Grant heirs. Unrelated deed: E.W. Keller & Eunice J. Keller→John Sharton, lots 138 & 139 Pike Street, Monongahela City, $2,000, 20 Mar 1875. DEED BODY PAGE (property description with metes and bounds): https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89GT-K — image 108 of 264, preceding the acknowledgment page (image 109). Metes and bounds cite J.R. Moorehead land as adjacent boundary on two courses — Moorehead/Monongahela Navigation Company land so pervasive in this corridor it functions as a fixed landmark in virtually every Carroll Township property description.

BATCH: SRCH-002'
);

-- NR-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'NR-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'NR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    49,
    '1840',
    'Naturalization record (Connell Boyle as witness)',
    'Washington County',
    'PA',
    'Washington. Naturalization Record Indexes; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-C91T-XW8L-Y?view=fullText&keywords=Connell+Boyle&searchForm=advanced&lang=en',
    'Connell Boyle serves as witness to the naturalization of Patrick Donaly (Irish immigrant) at Washington County Court of Common Pleas, October 9, 1840. Co-witness William Lambert is the same Lambert who appears as adjacent landowner in Boyle property metes and bounds (PR-032). Pattern consistent with Connell''s documented community role as will witness (WL-001, WL-002) and deed witness. Patrick Donaly is a new name — an Irish immigrant neighbor using Connell''s community standing to support his naturalization. This is the fourth documented instance of Connell serving in a formal witness/vouching capacity for Washington County neighbors.

DATES: Naturalization: 9 Oct 1840. Proceeding No. 383, August Term 1840, Washington County Court of Common Pleas.

NAMES: Patrick Donaly (naturalizee — Irish immigrant, country of birth Ireland; new name); William Lambert (co-witness — adjacent Boyle landowner); Connell Boyle (witness — almost certainly our Connell; date/location/pattern all consistent).

LOCATIONS: Washington County PA, Court of Common Pleas.

CITED RECORDS: William Lambert (co-witness) appears as adjacent landowner in PR-032 metes and bounds (''Wm. Lambert''s lot'') — confirms neighborhood connection.

BATCH: SRCH-002'
);

-- PR-044
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-044',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    50,
    '1861',
    'Probate record (Connell Boyle estate, court index)',
    'Washington County',
    'PA',
    'Washington. Probate Records; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-L9VP-BPLH?view=fullText&keywords=Connell+Boyle%2CWashington&searchForm=advanced&lang=en',
    'Connell Boyle estate probate, Account #3, 1861 Washington County court proceedings. CONFIRMS: (1) Connell died in 1861 (combined with Nov 1860 Wickersham deed citing his estate, death was between Nov 1860 and this filing — probably early 1861); (2) Felix Boyle Jr. (Captain Felix, age ~22) named administrator of his father''s estate — significant responsibility for a young man; explains why he was quitclaiming Carroll Township land in April 1861 (PR-043) while simultaneously settling the estate and preparing for Civil War service. Updates TODO-008: Connell died early 1861, narrowed from ''before November 1860.'' Daniel Vanvoorhis estate also in same session (Samuel Cooper & Newton Vanvoorhis executors).

DATES: 1861. Probate proceedings, Washington County PA Court.

NAMES: Connell Boyle (decedent — DEATH CONFIRMED 1861, between Nov 1860 and this probate filing). Felix Boyle Jr. (administrator — Captain Felix, age ~22; first documented administrative role; simultaneously settling estate and preparing for Civil War service per Apr 1861 quitclaim in PR-043).

LOCATIONS: Washington County PA. Probate Court.

CITED RECORDS: Same 1861 probate session: Frances F. Sampson estate (A.C. Sampson, admr.); Daniel Vanvoorhis estate (Samuel Cooper & Newton Vanvoorhis, executors — same Vanvoorhis family from adjacent landowner references). Account numbers suggest sequence within same court term.

BATCH: SRCH-002'
);

-- PR-045
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-045',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    51,
    '1875',
    'Deed (Shanton→Harris & Hams, post-Boyle chain)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1875–1876; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89P7-H?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania&searchForm=advanced&lang=en&groupId=M9Z4-YLD',
    'John Shanton resells 87 acres (portion of 192-acre Carroll Township parcel purchased from Boyle heirs in PR-043) to Hannah Harris and Ruben Hams for $7,395, August 1875 — five months after buying from the Boyle heirs. Land continues to be parceled and sold. No new Boyle family information. Coal reservation and passage rights carried forward unchanged.

DATES: Deed: ca. Aug 1875. Acknowledged: 17 Aug 1875 before Jno. Holland, Alderman, Monongahela City. Recorded: 30 Dec 1875.

NAMES: John Shanton and Louisa Shanton his wife (grantors); Hannah Harris and Ruben Hams (grantees, $7,395). Prior grantors recited: Zeph M. Boyle, John Boyle Jr., Rebecca Boyle, Annie McGurgan, Frank McGurgan (heirs of Connell Boyle dec.) — per PR-043. Witnesses: Jno. Hollomel; Peter McCullough. J.P./Alderman: Jno. Holland.

LOCATIONS: Carroll Township, Washington County PA. 87 acres (portion of 192-acre Boyle parcel from PR-043). Coal reserved by O''Hara heirs; Noah/Elgy Grant passage rights.

CITED RECORDS: Cites Boyle heirs→Shanton deed as ''thirtieth day of March A.D. 1875'' (PR-043 had acknowledgment date March 3, 1875 — minor date discrepancy). Coal reservation (O''Hara heirs) and Noah/Elgy Grant passage rights carried forward. Unrelated deed: John F. Ferrell & Margaret→Andrew J. Reynolds, Ten Mile Creek, Amwell Township, 30 Mar 1875.

BATCH: SRCH-002'
);

-- PR-046
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-046',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    52,
    '1884',
    'Two deeds: coal conveyance (Wickersham land) + Lock No.4 land to Monongahela Navigation Company',
    NULL,
    'PA',
    'Washington. Deed Books 1884–1885; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ7-MNC2?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M9ZZ-25J',
    'Two deeds, 1884. DEED 1: George T. Work trustee→W. Seward B. Hays, coal under 200 acres of Wickersham land, Carroll Township. ''Connell Boyle'' cited in metes and bounds as a boundary landmark — historical reference to former Boyle land, 20+ years after Connell''s death; same neighborhood as C.&J. Boyle operations. DEED 2: John Conrad→Monongahela Navigation Company, 2 acres 1 rood at Village of Lock No.4, Fallowfield Township, $1,228.12, October 8, 1884. THIS IS THE BOATYARD LOCATION: the Monongahela Navigation Company (J.K. Moorhead''s company, now run by his son Maxwell K. Moorhead after J.K.''s death March 6, 1884) is buying land at Lock No.4 in the same year Moorhead Sr. died. The company that controlled the river infrastructure the C.&J. Boyle boatyard depended on is now acquiring the land at that same location, 31 years after the Boyles sold out. The circle from Moorhead''s 1854 trust arrangement to his company owning Lock No.4 land in 1884 is now complete.

DATES: Work→Hays deed acknowledged: 6 Feb 1884. Conrad→Monongahela Navigation Company deed: 8 Oct 1884.

NAMES: George T. Work (trustee, grantor); W. Seward B. Hays (grantee, coal under Wickersham land). ''Connell Boyle'' cited in metes and bounds as boundary reference — historical landmark use, land formerly Boyle''s, 20+ years after his death. John Conrad (grantor, Lock No.4 land); Monongahela Navigation Company (grantee — Moorhead''s company, Maxwell Moorhead now president after J.K. Moorhead''s death Mar 1884). C.M. Ruple (J.P.); August Work Hughes Jr. (Recorder).

LOCATIONS: Carroll Township (Work→Hays coal, 200 acres Wickersham land); Village of Lock No.4, Fallowfield Township (Conrad→Monongahela Navigation Company, 2 acres 1 rood — exact location of C.&J. Boyle boatyard).

CITED RECORDS: Work→Hays coal deed: Wickersham coal conveyed by William Wickersham in lifetime to W. Seward B. Hays, 200 acres. Charges on property: $3,011.50 interest to Eliza Robison (widow of Robert Robison) and $639.19 interest to Rebecca Robison (widow of S.B. Robison). Conrad→Monongahela Navigation Company: Village of Lock No.4, Fallowfield Township, $1,228.12, 2 acres 1 rood. Monongahela Navigation Company was J.K. Moorhead''s company — Maxwell Moorhead inherited presidency from his father James K. Moorhead, who died March 6, 1884 (same year as this deed).

BATCH: SRCH-002'
);

-- PR-047
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-047',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    53,
    '1867',
    'Deed (Felix Boyle Jr.→Zeph M. & John Boyle, 67 acres, $3,770)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1867–1868; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-874Y?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CWashington&searchForm=advanced&lang=en&groupId=M9Z7-K16',
    'Felix Boyle Jr. (Captain Felix, age ~28) sells the 67-acre Carroll Township surface parcel to his brothers Zeph M. Boyle and John Boyle for $3,770, April 1867. SOURCE DEED for the Felix Boyle→Zeph M. & John Boyle Jr. transfer cited in PR-043 title chain. COMPLETE FELIX JR. SEQUENCE NOW DOCUMENTED: (1) Apr 6, 1864: Rabe→Felix Jr., $3,350 (PR-035); (2) Apr 1867: Felix Jr.→Zeph M. & John Jr., $3,770 (this deed) — $420 profit over 3 years; (3) Mar 1875: Boyle heirs→Shanton, $15,360 for 192 acres (PR-043). Felix bought at end of Civil War (1864), held 3 years, sold to brothers Apr 1867, walked away from Carroll Township permanently at age 28. He never reclaimed an interest. ''Heirs of Connell Boyle deceased'' still cited in metes and bounds as adjacent landowners — 6 years after Connell''s death, his name still on the landscape. OCR: ''thirteenth day of April 1861'' = 1867; ''Felit Boyle Jr.'' = Felix Boyle Jr.; ''Felix Bond'' = Felix Boyle; ''John Wikerchams'' = Wickersham.

DATES: Deed: April 1867. Acknowledged: 13 Apr 1867 (OCR: ''1861'' — error) before J.S. Judson J.P. Recorded: 18 Apr 1867 by M.S.R. McCracken.

NAMES: Felix Boyle Jr. (grantor — Captain Felix, age ~28; selling Carroll Township land permanently); Zeph M. Boyle and John Boyle (grantees, $3,770). Prior grantor: Hiram Rabe & wife (6 Apr 1864, PR-035). Witness and J.P.: J.S. Judson. Recorder: M.S.R. McCracken.

LOCATIONS: Carroll Township, Washington County PA. 67 acres surface (same Rabe parcel as PR-035). Neighbors: John Wickersham, J.G. Grant, Daniel Gallagher, heirs of Connell Boyle dec. (adjacent — still cited as boundary 6 years after Connell''s death), Robert Grant, Eley Grant, David Grant heirs.

CITED RECORDS: Source deed for Felix Boyle Jr.→Zeph M. & John Boyle Jr. transfer cited in PR-043 title chain (there listed as ''April 13, 1899'' — OCR error for April 13, 1867). Prior deed: Hiram Rabe & wife→Felix Boyle Jr., 6 Apr 1864, ''Book & void pages 528 & 529'' (OCR garble — = PR-035). Unrelated deed on same pages: William Warnan & Permella Warnan acknowledgment, 1 Apr 1867.

BATCH: SRCH-002'
);

-- EX-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'needs_review'),
    54,
    '1857',
    'UNCERTAIN — possibly different Connell Boyle or OCR error',
    'Armstrong County',
    'PA',
    'Armstrong. Deeds 1876–1881; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-352G?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania&searchForm=advanced&lang=en',
    'UNCERTAIN: Title chain cites ''Philip Loon & Connell Boyle'' receiving a Sugar Creek Township, Armstrong County half-acre lot by Orphan''s Court order, September 16, 1857. Possibly our Connell Boyle (date consistent, alive in 1857), but: (1) no other Armstrong County connections documented; (2) Philip Low/Loon is an unknown name in the Boyle network; (3) ''Waistrongwo'' (OCR for Washington or Armstrong County) is ambiguous; (4) ''Connell Bay'' appears as a second OCR rendering of the same name in the same chain; (5) Sugar Creek Township half-acre lot is an odd addition for a Washington County boatyard operator in declining health. Most likely a different Connell Boyle or OCR corruption of a different name entirely.

DATES: Orphan''s Court order citing Connell Boyle: 16 Sep 1857. Deed from McBride to Cody: 22 Apr 1861.

NAMES: Philip Loon/Low (co-purchaser with ''Connell Boyle'' per OCR). ''Connell Boyle'' and ''Connell Bay'' in title chain — identity uncertain.

LOCATIONS: Sugar Creek Township, Armstrong County PA. Half-acre lot.

CITED RECORDS: Title chain for Sugar Creek Township half-acre lot in Armstrong County. Full chain: Denniston patent 1807→Bollman→Joseph Bollman→Robert Dickey→George F. Keiner (guardian of Anna Payne Dickey)→Philip Loon/Low & Connell Boyle (Orphan''s Court order, 16 Sep 1857)→Stephen McCue (6 Mar 1854)→Miles McBride→Patrick McBride (sheriff''s deed 1859)→Patrick McBride & Catharine→Rev. Joseph Cody (this deed, 1861).

BATCH: SRCH-002'
);

-- PR-048
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-048',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    55,
    '1866',
    'Deed (Vanvoorhis→O''Hara, late title chain recital with Boyle references)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1866–1867; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-79HC-M?view=fullText&keywords=Connell+Boyle%2CWashington&searchForm=advanced&lang=en&groupId=M9Z7-VL2',
    'Vanvoorhis→O''Hara deed (ca. 1866–67) reciting full Carroll Township title history. NEW EARLIEST PREDECESSOR: Philadelphia Bank conveyed to Samuel Davis June 8, 1832, Book Vol.2 p.154 — the Bank held the Carroll Township river land before Davis, adding one more step back in the chain. NEW BOOK REFERENCE: Boyle→O''Hara deed cited at Book I Vol.3 p.91 (previously unrecorded reference). Samuel Davis→Boyle deed cited as Deed Book Q Vol.2 p.379, May 20, 1833 (consistent with PR-029 except date: May 20 vs May 30). ''Charles K. Moorhead'' almost certainly OCR for J[ames] K. Moorhead. O''Hara''s coal reservation from the PR-025 Boyle→O''Hara deed is confirmed as surviving into this deed. ''Co J. Boyle'' in metes and bounds = C.&J. Boyle firm name as boundary reference. Abraham F. Vanvoorhis is the same Vanvoorhis family appearing throughout as neighbors (Newton Vanvoorhis in PR-043, Daniel Vanvoorhis will in WL-001 area). William Taylor purchasing coal from Vanvoorhis (24.5 acres) is a new transaction not previously documented.

DATES: This deed: ca. 1866–1867 (deed book dates). Title chain transactions span 1832–1866.

NAMES: Abraham F. Vanvoorhis and wife (grantors); James O''Hara (grantee). Boyle references: John Boyle and Connell Boyle & wife (cited as prior grantors to ''Carles/Charles K. Moorhead'' = J.K. Moorhead OCR; and as grantors to James C. Hard/O''Hara). ''Co J. Boyle'' in metes and bounds = C[onnell] & J[ohn] Boyle firm. H. Myers & Co. two-acre exception carried forward. Philadelphia Bank (prior grantor to Davis, 1832 — NEW). William Taylor (Vanvoorhis coal purchaser, 24.5 acres).

LOCATIONS: Carroll Township, Washington County PA. Multiple tracts: 386 acres 110 perches (Vanvoorhis aggregate including coal); 63 acres 7 perches (land and coal); 100 acres 102 perches (O''Hara→Boyle parcel, PR-025); 30 acres 66⅔ perches (river surface, formerly Boyle).

CITED RECORDS: Title chain (river surface tract): Philadelphia Bank→Samuel Davis, 8 Jun 1832, Book Vol.2 p.154 (NEW — earliest documented predecessor); Davis→Connell & John Boyle, 20 May 1833, Deed Book Q 2d p.379 (confirms book Q; date varies: PR-029 had May 30); Boyle→James C. Hard/O''Hara, 20 Feb [1855], Book I Vol.3 p.91 (NEW book reference for PR-002/PR-012). Boyle→Moorhead deed: Book N [Vol.3] p.339, 13 May 1854 (consistent). Vanvoorhis coal chain: Abraham F. Vanvoorhis→O''Hara, Jul [14/15] 1852, Book M Vol.3 pp.23–24 (coal); Vanvoorhis→O''Hara, Jul [14] 1852, Book Mc Vol.3 pp.23–24 (surface). Lot No.2 purchased by Vanvoorhis from his father, 5 Dec 1883 [OCR error for 1843?], Book Vol.2½ p.381. A.F. Vanvoorhis coal sold to William Taylor (24.5 acres). Noah and [deceased] Grant passage rights reserved throughout.

BATCH: SRCH-002'
);

-- PR-049
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-049',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    56,
    '1870',
    'Deed (Gillmore conveyance, late title chain recital)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1870–1871; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-33NN?view=fullText&keywords=Connell+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'Gillmore conveyance ca. 1870–71 reciting Carroll Township title chain. KEY CONFIRMATIONS: (1) Boyle→O''Hara deed: Book P Vol.3 p.91 — corrects PR-048''s ''Book I'' (OCR error); (2) Samuel Davis deed date: May 30, 1833 confirmed — PR-048''s ''May 20'' was OCR error; (3) ''C. & J. Boyles'' explicitly in metes and bounds; (4) O''Hara→Gillmore: September 1, 1866, Book I Vol.4 pp.75/78; (5) ''Elsie Grant'' = Elgy/Elze/Elijah Grant. Philadelphia Bank holding Carroll Township river land before 1832 confirms eastern capital speculation preceding the Boyle operation — bank acquired, sold to Davis (speculator), Davis sold to Boyles (operators). Conveyance to grantees as ''tenants in common.'' 13-acre surface exception surveyed by Brisben Wall October 15, 1868 (same surveyor who surveyed the combined 192-acre Boyle parcel in 1869 for PR-043).

DATES: This deed: ca. 1870–1871. O''Hara→Gillmore: 1 Sep 1866. Title chain spans 1832–1868.

NAMES: George F. Gillmore (grantor, party of first part); unknown grantees (parties of second part, receiving as tenants in common). Prior parties: James O''Hara & wife; Abraham F. Vanvoorhis; John Boyle & Connell Boyle & wife; Samuel Davis; Philadelphia Bank. ''C. & J. Boyles'' in metes and bounds (firm name confirmed). ''Elsie Grant'' = Elgy/Elze Grant (OCR variant).

LOCATIONS: Carroll Township, Washington County PA. Same tracts as PR-048: 100 acres 102 perches (O''Hara surface coal); 30 acres 66⅔ perches (river tract, excl. H.Myers & Co. 2 acres). 13 acres of surface excepted from Gillmore conveyance (13-acre lot described with Brisben Wall survey, October 15, 1868).

CITED RECORDS: Gillmore→[unknown] deed reciting: O''Hara→Gillmore, 1 Sep 1866, Book I Vol.4 pp.75 & 78 (two page refs, minor discrepancy). Philadelphia Bank→Davis, 6 Jun 1832, Book [Q] Vol.[2] p.154 (date: ''June 6'' here vs ''June 8'' in PR-048 — minor OCR variation). Davis→Boyles, 30 May 1833, Deed Book [Q] 2nd p.379 (confirms May 30 date; PR-048''s ''May 20'' was OCR error). Boyle→O''Hara, 20 Feb 1855, Book P Vol.3 p.91 (CONFIRMS Book P — PR-048 had ''Book I'' which was OCR for ''P''). Boyle→Moorhead, 13 May 1854, Deed Book N 3rd p.339 (consistent). Vanvoorhis→O''Hara coal, 3 Jul 1852, Book N. Vol.[3] pp.23–24 (consistent).

BATCH: SRCH-002'
);

-- PR-050
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-050',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    57,
    '1875',
    'Deed (third image of PR-043 — beginning/property description pages)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1875–1876; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89GT-K?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CWashington&searchForm=advanced&lang=en&groupId=M9Z4-YLD',
    'Third FamilySearch image of the Boyle heirs→John Shanton deed (PR-043), March 30, 1875, $15,360. Shows the beginning and property description pages not captured in PR-043. New OCR variants: ''James D. Ward'' = James O. Hard/O''Hara (boundary reference); ''J. R. Moorehead'' = J.K. Moorhead (boundary reference). No new substantive information. THIS IS THE FINAL RECORD IN THE WASHINGTON COUNTY (SRCH-002) SEARCH BATCH.

DATES: Deed: 30 Mar 1875. Same as PR-043.

NAMES: Same parties as PR-043: Reph/Zeph M. Boyle, Jno. Boyle, Mrs. Rebecca Boyle, Mrs. Annie McGragan/McGurgan, Frank M. McGurgan (heirs of Connell Boyle dec.); John Shanton (grantee). OCR: ''James D. Ward'' = James O. Hard/O''Hara; ''J. R. Moorehead'' = J.K. Moorhead.

LOCATIONS: Carroll Township, Washington County PA. Same tract as PR-043. Metes and bounds cites ''James D. Ward'' (OCR for James O. Hard/O''Hara) and ''J. R. Moorehead'' (OCR for J.K. Moorhead) as boundary references.

CITED RECORDS: Third image of Boyle heirs→Shanton deed (PR-043). Same groupId M9Z4-YLD as PR-043 and PR-045. Shows beginning/property description pages not visible in PR-043.

BATCH: SRCH-002'
);

-- PR-051
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-051',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    58,
    '1854',
    'Declaration of trust (Moorhead holds undivided half in trust for Boyles as co-investors)',
    'Washington County',
    'PA',
    'Washington. Deeds 1857–1858; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-SS21?view=fullText&keywords=Connell+Boyle%2CAllegheny&searchForm=advanced&lang=en',
    'REFRAMES THE MOORHEAD TRANSACTION: J.K. Moorhead declares he holds the Carroll Township coal/land portfolio in trust for the Boyles as 50/50 co-investors, NOT as a creditor holding their land as security. Structure: Moorhead contracted to purchase the property package for both parties; Boyles paid $2,500 at execution + $1,500 first installment ($4,000 total of their moiety); bound to pay remaining moiety of installments. Moorhead holds undivided half for himself, undivided half in trust for Boyles as tenants in common. The Boyles retained a beneficial half-interest in the Carroll Township coal/land portfolio even after the May 1854 Moorhead transaction. They lost that interest only upon failure to pay remaining purchase money installments — which the financial chaos of the late 1850s almost certainly caused. This explains why subsequent sales (Wallace, McClean, Kerr & Gillespie) generated no documented proceeds for the Boyle family. Recorded November 28, 1857 — three years after the original transaction, consistent with the Boyle pattern of delayed recording. Acknowledgment taken in Pittsburgh by Alderman Buckmaster — same family as the Buckmaster who acknowledged John Boyle''s deed in Pittsburgh for the O''Hara transaction (PR-012). Appearing in Allegheny County search because acknowledgment was taken in Pittsburgh.

DATES: Deed executed: ca. May–Jun 1854 (same time as Moorhead trust deed, PR-026/PR-027). Acknowledged: 12 Jul [1857] before Alderman A. Buckmaster, Pittsburgh. Recorded: 28 Nov 1857.

NAMES: J.K. Moorhead (party of first part — OCR: ''I Kennedy Moorhead''; holds half for himself, half in trust for Boyles); Connell Boyle and John Boyle (parties of second part — beneficiaries of trust, co-investors holding undivided half as tenants in common). Alderman A. Buckmaster (acknowledgment, Pittsburgh — same Buckmaster family as N. Buckmaster who witnessed John Boyle''s O''Hara deed). Witnesses: N. Buckmaster.

LOCATIONS: Carroll Township and Fallowfield Township, Washington County PA. Same package as PR-026/PR-027: Davis parcels + Sampson coal (119 acres 52 perches) + Rape coal.

CITED RECORDS: Property package recited: (1) Samuel Davis & wife→John and Connell Boyle (fee, sundry deeds); (2) James Sampson & Mary→John and Connell Boyle, 13 May 1854 (fee); (3) David Gardiner Robe/Rape→John and Connell Boyle, 13 May 1854 (fee). Boyles'' payments to date: $2,500 at execution + $1,500 first installment = $4,000 paid of their moiety. Remaining moiety of purchase money still due. ''Mortgage bearing even date'' = MG-001. Companion to PR-026/PR-027 (Boyle→Moorhead deed) and PR-039 (Moorhead→Shaler/Stanton/Wimbstetter).

BATCH: SRCH-003'
);

-- PR-052
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-052',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    59,
    '1845',
    'Deed (James Boyle → Felix Boyle, one-seventh share of Rice–Philemon Boyle land)',
    'Washington County',
    'PA',
    'Washington. Deeds 1845–1846; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-S7WW?view=fullText&keywords=Philemon+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    'KEY PHILEMON RECORD. James Boyle conveys his one-seventh (1/7) interest in the Rice–Boyle land to Felix Boyle for $263. The underlying land was conveyed by James Rice and Sophia Rice to Philemon Boyle by deed dated 2 Feb 1801, recorded Book T Vol. 2d pp. 156–157, Washington County. James Rice is Phelim''s father-in-law (per Beers 1893: Phelim ''was there married to Ann, daughter of James Rice''). The 1801 deed is almost certainly a MARRIAGE SETTLEMENT — land transferred from Ann Rice''s parents to Phelim at or around the time of marriage (Connell born Carroll Twp April 1802, consistent with family being established on this land by 1801–1802). ONE-SEVENTH SHARE: Phelim''s estate divided into seven shares among his children — confirms at least 7 heirs, three still unidentified (known sons: Connell, Felix Sr., James, John Boyle). Felix Sr. buying out James''s share in 1845 is consistent with his role as family land consolidator. EARLIEST WASHINGTON COUNTY PRIMARY SOURCE FOR PHILEMON BOYLE. The underlying Rice→Philemon deed (Book T Vol. 2d pp. 156–157, 2 Feb 1801) is a high-priority pull — it is the founding document for the family''s Carroll Township landholding and may name the specific tract.

DATES: Deed executed: 24 May 1845. Acknowledged: 24 May 1845 before R. Hazzard JP. Recorded: 26 May 1845. Underlying Rice→Philemon Boyle deed: 2 Feb 1801.

NAMES: James Boyle (grantor — son of Philemon Boyle, selling his one-seventh share); Felix Boyle (grantee — son of Philemon Boyle, the ''rich uncle'' Felix Sr., 1813–1884, consolidating family land). James Rice and Sophia Rice (prior grantors in underlying 1801 deed — James Rice is Phelim''s father-in-law; Ann Rice is Phelim''s wife per Beers 1893). Witnesses: Ross Black, Marcus Black. Acknowledgment: R. Hazzard JP. Recorder: James Brown.

LOCATIONS: Washington County PA (specific township not named in this deed — Carroll or Fallowfield, consistent with family landholdings). Land described only by reference to Book T Vol. 2d pp. 156–157.

CITED RECORDS: Underlying deed: James Rice and Sophia Rice → Philemon Boyle, 2 Feb 1801, Washington County Deed Book T Vol. 2d pp. 156–157 (HIGH PRIORITY — pull this record). This is the image that appeared as the sole result for quoted ''Philemon Boyle'' search in Washington County (SRCH-004).

BATCH: SRCH-004'
);

-- BIO-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'BIO-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'BIO'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    60,
    '1893',
    'Published biography (J.H. Beers 1893 Washington County PA)',
    'Washington County',
    'PA',
    'Washington. Biographies (J.H. Beers & Co., 1893); via FamilySearch / Google Play Books',
    NULL,
    'FOUNDATIONAL SOURCE. Elizabeth V. Henderson Boyle (Felix Sr.''s widow) paid for and provided the family history behind this entry. KEY FINDINGS: (1) PHELIM''S DEATH DATE: 2 January 1841, Carroll Township — from family tradition via Elizabeth Henderson (secondary, but from an insider source; stronger than tree entries). (2) ANN RICE DEATH DATE: 15 April 1864. (3) JAMES RICE came to Washington County in 1780 and in 1791 erected a house ''the corner-stone of which perpetuates his memory'' — the 1791 date aligns exactly with Phelim''s reported arrival in PA; he likely married Ann Rice shortly after arriving. (4) COMPLETE LIST OF PHELIM''S 7 CHILDREN in birth order: Alice, Connell, John, Esther (Mrs. Richard Crosby), Maria, Felix, James — CONFIRMS the one-seventh shares in the 1845 partition deed (PR-052). (5) Felix Sr. learned ''carpentry and ship-building at Elizabethtown, Penn.'' — explains the Monongahela boatyard expertise. (6) Felix Sr. worked ''on the Red river under Capt. Shreve, who founded the town of Shreveport, La.'' and helped break up the Great Red River Raft. (7) C. & J. Boyle confirmed as Connell AND John Boyle operating ''two large shipyards near Monongahela.'' (8) Phelim owned 123 acres in Carroll Township and ran a distillery specializing in peach brandy. BLACK FAMILY NOTE: ''Comrade named Black'' saved Phelim on the New Orleans flatboat run. Ross Black and Marcus Black are witnesses to the 1845 James Boyle→Felix Boyle deed (PR-052). Almost certainly the same family — the Blacks were close neighbors and associates of the Boyles in Carroll Township across multiple generations.

DATES: Published 1893. Key dates recorded: Phelim/Felix Boyle Sr. born County Donegal, Ireland; died 2 Jan 1841, Carroll Twp. Ann Rice Boyle died 15 Apr 1864. Felix Boyle Jr. (rich uncle) born 13 Jun 1813 Carroll Twp; died 4 Oct 1884 Carroll Twp. Maria Boyle (Felix Jr.''s daughter) died 25 Dec 1878. Joseph James Boyle born 19 Oct 1876.

NAMES: Felix Boyle [Phelim, the patriarch] (born County Donegal; died 2 Jan 1841 Carroll Twp); Ann Rice Boyle (wife; died 15 Apr 1864); James Rice (Ann''s father; came to Washington County 1780; erected house 1791); Sophia Rice (Ann''s mother). Children of Phelim in birth order: Alice Boyle, Connell Boyle, John Boyle, Esther Boyle (Mrs. Richard Crosby), Maria Boyle, Felix Boyle [Sr., 1813–1884], James Boyle. Felix Boyle Sr. (son; born 13 Jun 1813; died 4 Oct 1884 of cancer); Elizabeth V. Henderson Boyle (Felix Sr.''s second wife, married Feb 1873; source of this biography); Joseph James Boyle (b. 19 Oct 1876; living on farm 1893); Maria Boyle (Felix Sr.''s daughter; died 25 Dec 1878). Miss Crosby (granddaughter of Phelim via Esther; living with Elizabeth Henderson Boyle 1893). Capt. Henry Miller Shreve (Felix Sr.''s employer on Red River — founded Shreveport LA). ''Comrade named Black'' (saved Phelim on flatboat to New Orleans — see BLACK FAMILY NOTE).

LOCATIONS: Carroll Township, Washington County PA. Monongahela (formerly Williamsport). Red River LA (Shreve connection). Rio Grande TX. Elizabethtown PA (shipbuilding apprenticeship).

CITED RECORDS: Already in Carolyn''s Google Play Books library. FamilySearch collection: Washington. Biographies | Marcellus. Cemetery Records | Victor. Cemetery Records, #007811514, Item 3, image 339 of 755. Page 654–655 of the 1893 Beers Washington County biographical record.

BATCH: SRCH-007'
);

-- PR-053
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-053',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    61,
    '1818',
    'Deed (Archer → Morrow, 153 acres, Dutch Fork of Buffalo Creek)',
    'Washington County',
    'OH',
    'Washington. Deeds 1818–1820; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNG-B6QR?view=fullText&keywords=James+Rice%2CWashington&searchForm=advanced&lang=en',
    'RICE FAMILY NETWORK. James Rice and George Rice witness together — almost certainly brothers or close relatives. Title chain shows Jacob Rice → Daniel Rice (1796), then Daniel & Nancy Rice sold to Wever (1803) — extended Rice family holding land in Washington County 1784–1818. Our James Rice (Ann''s father, arrived 1780) consistent as witness in 1818 but not confirmed. George Rice alongside James as witness suggests brothers. Key question: is Dutch Fork of Buffalo Creek near Carroll Township? If so this places a Rice family cluster geographically close to the Boyle landholding.

DATES: Deed: 21 Feb 1818. Title chain spans 1784–1818.

NAMES: George Archer and Polly Archer (grantors); George Morrow (grantee, $1,856). Title chain: Jacob Rice (grantor 1796); Daniel Rice and Nancy Rice (grantors 1803). Witnesses: George Rice and James Rice. JP: Barnett Ristine (Adams County OH).

LOCATIONS: Dutch Fork of Buffalo Creek, Washington County PA. George Archer resident of Adams County OH by 1818.

CITED RECORDS: Title chain: Jacob Conice original survey Sep 1784; patent Sep 2 1790; Jacob Rice → Daniel Rice, Sep 29 1796; Daniel & Nancy Rice → Addom Wever, Apr 13 1803, Book I p.32; Addom & Catherine Wever → Nicholas Wever, Apr 4 1809, Book X p.576; Nicholas & Elizabeth Wever → George Archer, Book A Vol.2 pp.174–175.

BATCH: SRCH-008'
);

-- BIO-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'BIO-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'BIO'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    62,
    '1796',
    'Published county history (Schenck 1882, Carroll Township section)',
    'Washington County',
    'PA',
    'Pennsylvania. Military Records 1882 | Washington. Biographies 1882; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-89DX-7ZNL?view=explore&keywords=James%20Rice%2CWASHINGTON%2CWashington%2CPENNSYLVANIA&searchForm=advanced&lang=en&groupId=M9R7-1P1',
    'JAMES RICE CARROLL TOWNSHIP LAND CONFIRMED. James Rice received a warrant for 263 acres in Carroll Township entitled ''ROMANIA,'' April 12 1796, surveyed October 20 1797, adjoining Abraham Frye and the Monongahela River. SIGNIFICANCE: (1) Confirms James Rice as a substantial Carroll Township landowner — 263 acres on the Monongahela is a major holding, not a marginal settler. (2) The 1801 Rice→Philemon Boyle marriage settlement deed (Book T Vol.2d pp.156–157) almost certainly conveys part of this ''Romania'' tract — Phelim''s documented 123 acres (per Beers) is roughly half of Rice''s 263 acres. (3) ''Romania'' as a tract name: possibly a reference to Rome/Roman Catholic identity — the Rice family were Norman Catholic gentry; naming land ''Romania'' in 1796 Washington County PA would be a deliberate cultural marker. Alternatively a creative or personal name. Worth exploring. (4) James Rice is placed firmly in Carroll Township, the SAME township as the Boyle farm, from at least 1796 — they were neighbors before they were in-laws.

DATES: Warrant issued: 12 Apr 1796. Survey: 20 Oct 1797.

NAMES: James Rice (warrant holder). Abraham Frye (adjoining landowner).

LOCATIONS: Carroll Township, Washington County PA. Tract ''Romania,'' 263 acres, adjoining lands of Abraham Frye and the Monongahela River.

CITED RECORDS: Carroll Township history section, pp. 690–691. Same book series as BIO-001 (Beers 1893) but this is the 1882 Washington County history by John S. Schenck. FamilySearch #007548320, Item 2, image 403 of 601.

BATCH: SRCH-008'
);

-- PR-054
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-054',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    63,
    '1801',
    'Deed (James Rice & Sophia Rice → Philemon Boyle, 123½ acres)',
    'Washington County',
    'PA',
    'Washington. Deeds 1831–1835; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-SCMZ?view=fullText&keywords=James+Rice&searchForm=simple&lang=en',
    'THE FOUNDATIONAL DEED. James Rice and Sophia Rice convey 123½ acres to Philemon Boyle for $988 on Feb 2 1801. TWO PARCELS: (1) 7 acres 51 perches from ''Inheritance'' tract (originally Snap, conveyed to Rice Feb 24 1794); (2) 116 acres 1 perch from ''Romania'' (Rice''s 263½-acre Carroll Township patent, Nov 13 1800). Together = 123½ acres — exactly matching Phelim''s documented holding per Beers 1893. ROMANIA IS PHELIM''S LAND: not adjacent to it — Romania was Rice''s patent and this deed conveys the eastern portion to Phelim. Rice retained ~147 acres of Romania plus remainder of Inheritance tract. CONSIDERATION $988: substantial cash payment — either Phelim arrived with significant capital, or this is a family transaction where the stated price reflects Ann''s inheritance share rather than arm''s-length cash. SAMUEL BLACK WITNESS: Samuel Black witnesses this deed in 1801 — the same Samuel Black who appears in the 1826/1836 Carroll Township trust deed, and almost certainly father/relative of Ross and Marcus Black who witness the 1845 Boyle deed (PR-052). Three generations of Blacks woven into Boyle-Rice land records. DELAYED RECORDING: executed 1801, recorded 1833 — 32-year gap. Appears in 1831–1835 deed books rather than 1800–1805.

DATES: Deed executed: 2 Feb 1801. Acknowledged: 2 Feb 1801 before Daniel Depul JP. Recorded: 21 Mar 1833, W. Hoge Recorder.

NAMES: James Rice and Sophia Rice (grantors); Philemon Boyle (grantee, $988). Witnesses: Samuel Black, Daniel Depue, James Parison. JP: Daniel Depul. Recorder: W. Hoge.

LOCATIONS: Carroll Township, Washington County PA. Drains of Monongahela River. Boundaries: Abraham F. Snap, Robert Williams, William Crawford, Alexander George.

CITED RECORDS: Two underlying grants: (1) Patent to Abraham F. Snap for 367¾ acres ''Inheritance,'' Apr 11 1787; Snap→Rice for 7ac 51p, Feb 24 1794. (2) Patent to James Rice for 263½ acres ''Romania,'' Nov 13 1800 (warrant Apr 12 1796, survey Oct 20 1797 per BIO-002). Deed recorded 32 years after execution — consistent with Boyle pattern of delayed recording.

BATCH: SRCH-009'
);

-- PR-055
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-055',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    64,
    '1801',
    'Deed (James Rice & Sophia Rice → Robert Williams, 92½ acres Romania)',
    'Washington County',
    'PA',
    'Washington. Deeds 1807–1810; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS4T-6BVK?view=fullText&keywords=James+Rice%2CJames+++Rice&searchForm=simple&lang=en',
    'CRITICAL PRICE COMPARISON. Rice sells 92½ acres of Romania to Robert Williams for $43.20 on Jan 19 1801 — just 14 days before selling 123½ acres to Philemon Boyle for $988 (PR-054). Price per acre: Williams = ~$0.47/acre; Boyle = ~$8/acre. 17:1 ratio on the same tract in the same month. INTERPRETATION: The $988 Boyle consideration almost certainly represents Ann Rice''s inheritance share formalized as a deed price, not an arm''s-length market transaction. The Williams sale establishes the actual market rate for Romania land (~$0.47/acre). The Boyle deed is a family estate distribution dressed as a purchase — standard legal practice to give Phelim clear title. ROMANIA DISTRIBUTION: Rice sold 92½ acres to Williams (Jan 19), 116 acres to Boyle (Feb 2), retaining ~55 acres of Romania. All within two weeks — this is an active estate liquidation event, not casual sales. If Phelim paid $988 cash at market rates he''d have bought ~2,100 acres; instead he got 123½. The Depue family (John, Nic, Daniel) appear as witnesses/JP across both deeds — same neighborhood network.

DATES: Deed executed: 19 Jan 1801. Acknowledged: 30 Jan 1801 before Daniel Depue JP. Recorded: 21 Mar 1810, Isaac Kerr Recorder.

NAMES: James Rice and Sophia Rice (grantors); Robert Williams (grantee, $43.20). Witnesses: John Guthrie, John Depue, Nic Depue. JP: Daniel Depue. Recorder: Isaac Kerr.

LOCATIONS: Carroll Township, Washington County PA. Romania tract on Monongahela River. Begins at sugartree on bank of Monongahela River. Wolf harbour mentioned as boundary.

CITED RECORDS: Same Romania patent as PR-054: warrant Apr 12 1796, patent Nov 13 1800, 263½ acres. Boundaries: Abraham Fry/Frye, Snap, Alexander George, Dugal Boyd, Wolf harbour. Recorded same day as PR-054 (Mar 21 1810, Isaac Kerr Recorder).

BATCH: SRCH-009'
);

-- PR-056
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-056',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    65,
    '1801',
    'Deed (James Rice & Sophia Rice → William Crawford, 54 acres Romania)',
    'Washington County',
    'PA',
    'Washington. Deeds 1798–1802; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSXB-23RY-W?view=fullText&keywords=James+Rice&searchForm=simple&lang=en',
    'THIRD ROMANIA TRANSACTION, same date as PR-055. Rice sells 54 acres to neighbor William Crawford for $25.74 = ~$0.48/acre. ROMANIA NOW FULLY ACCOUNTED FOR: Williams 92½ acres ($0.47/ac) + Crawford 54 acres ($0.48/ac) + Boyle 116 acres ($8.00/ac) = 262½ of 263½ total acres, all sold within 14 days in Jan–Feb 1801. Market rate definitively established at ~$0.47–0.48/acre by two independent arm''s-length transactions. Boyle price of $988 for 116 acres is 17x market rate — CONFIRMS the $988 is Ann Rice''s inheritance share formalized as deed consideration, not a cash purchase. Crawford was already a boundary neighbor in PR-054; his 54-acre parcel and Williams''s 92½-acre parcel (PR-055) fit geometrically with the Boyle parcel to account for essentially all of Romania. James Rice liquidated his entire Carroll Township Romania holding in two weeks — a planned estate distribution event, not casual sales.

DATES: Deed executed: 19 Jan 1801 (same day as PR-055). Consideration receipt: 19 Jan 1801. No acknowledgment date given.

NAMES: James Rice and Sophia Rice (grantors); William Crawford (grantee, $25.74). Crawford was already a boundary neighbor in the Boyle deed (PR-054).

LOCATIONS: Carroll Township, Washington County PA. Romania tract. Crawford''s parcel shares boundary with Williams parcel (PR-055): ''thence by land of Robert Williams north 58 degrees west 114 perches to the beginning.''

CITED RECORDS: Same Romania patent as PR-054/PR-055: warrant Apr 12 1796, survey 263½ acres, patent Nov 13 1800. Boundaries: Abraham Frye, Snap, Alexander George, Dugal Boyd, Wolf harbour, Robert Williams (PR-055 grantee now a boundary reference).

BATCH: SRCH-009'
);

-- FB-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    70,
    '1884',
    'Two deeds: (1) warranty deed (Felix & Elizabeth → Phebe Wilson, 45 ac., coal reserved); (2) quitclaim (Felix → Phebe Wilson, 4 ac. coal, lifetime use retained)',
    'Washington County',
    'PA',
    'Washington. Deed Books 1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ3-NCFR?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-SMS',
    'TWO 1884 DEEDS, Fallowfield Township, six to seven months before Felix Boyle Sr.''s death (d. 4 Oct 1884). DEED 1 (28 Feb 1884): Felix Boyle and Elizabeth Boyle his wife of Carroll Township sell the ''John Boyle tract'' — 45 acres, 2 roods, 25 perches in Fallowfield Township — to Phebe Wilson for $2,739.20, RESERVING the six-foot river-vein coal beneath. DEED 2 (7 Mar 1884): Felix Boyle quitclaims 4 acres of Pittsburgh or river-vein coal (previously reserved when he sold coal rights to R.S. Wilson, who then conveyed to Phebe Wilson) to Phebe Wilson, but RETAINS a lifetime right to use the coal jointly with Phebe Wilson. KEY NOTES: (1) ''John Boyle tract'' — tract named for John Boyle (Connell''s brother, Felix''s brother); Felix acquired it via sheriff''s sale by N. McGiffin, meaning John Boyle''s land was subject to a judicial sale at some point, with Felix purchasing it. Adds a new chapter to John Boyle Sr.''s story. (2) Felix is liquidating Fallowfield Township assets in early 1884, months before his death; consistent with BIO-001 (Elizabeth Henderson paid for the Beers biography later in 1893, as widow managing the estate). (3) Elizabeth V. Henderson Boyle signs the warranty deed (Deed 1) as required for dower release; she does NOT appear in the coal quitclaim (Deed 2), which was Felix''s own reserved interest. (4) Felix retains lifetime coal use rights even after quitclaiming title — he needed the coal for the remaining months of his life (possibly heating the Carroll Township farm). (5) Phebe Wilson holds adjacent land (she is referenced in both deeds as owning adjacent/other property); the prior R.S. Wilson → Phebe Wilson conveyance suggests this is a family consolidation of coal interests. OCR: Document is well-transcribed; ''Amor Jeffries'' on p.230 = Amos Jeffries (unrelated deed fragment on same pages).

DATES: DEED 1: 28 Feb 1884 — Felix Boyle and Elizabeth Boyle his wife → Phebe Wilson, 45 ac. 2 rood 25 perches, Fallowfield Twp., $2,739.20. DEED 2: 7 Mar 1884 — Felix Boyle → Phebe Wilson, quitclaim of 4 ac. Pittsburgh/river-vein coal, Fallowfield Twp., $1 nominal. Both recorded: 6 May 1884.

NAMES: Felix Boyle (grantor, both deeds — Felix Boyle Sr., 1813–1884, Connell''s brother); Elizabeth Boyle his wife (grantor, Deed 1; OCR: ''Elizabeth Boyle his wife''); Phebe Wilson (grantee, both deeds, Fallowfield Township). Prior parties: N. McGiffin (High Sheriff, Washington County — previously conveyed the ''John Boyle tract'' to Felix by sheriff''s sale); R.S. Wilson (prior grantee of coal rights from Felix; then conveyed to Phebe Wilson). Witnesses/officials DEED 1 (confirmed via EX-011): John Holland (witness AND JP for acknowledgment — same Holland as PR-043 Monongahela City Alderman); Morton Black (co-witness — Black family recurring in Boyle legal network: Samuel Black, PR-054; Ross and Marcus Black, PR-052; now Morton Black, 1884). Witnesses/officials DEED 2: J. Holland (witness); Jas H. Smith (witness). P. Work Hughes Jr. (Recorder, both deeds).

LOCATIONS: Fallowfield Township, Washington County PA (both deeds). Felix and Elizabeth''s residence stated as Carroll Township. Monongahela City (Alderman Holland''s jurisdiction, for Deed 2 acknowledgment).

CITED RECORDS: John Boyle tract acquired by Felix Boyle via sheriff''s sale (N. McGiffin, High Sheriff of Washington County) — confirms John Boyle Sr. (Connell''s brother) held land in Fallowfield Township that passed to Felix Sr. via judicial sale. Prior coal conveyance: Felix Sr.→R.S. Wilson (earlier deed, not dated in this document)→Phebe Wilson. Elizabeth Boyle = Elizabeth V. Henderson Boyle, Felix Sr.''s second wife (married Feb 1873 per BIO-001, who provided the 1893 Beers biography). Recorder: P. Work Hughes Jr. (same Hughes as Washington County recorder in related records).

BATCH: SRCH-010'
);

-- EX-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    71,
    '1773',
    'EXCLUDED — different person and different name (OCR misread)',
    'Cumberland County',
    'PA',
    'Cumberland. Deeds 1750–1758, 1766–1776; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS73-MS1S-K?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'EXCLUDED: Not our Felix Boyle. Three reasons: (1) Cumberland County, central PA — the Boyle family was in Washington County, western PA; (2) 1773 — 18 years before Philemon Boyle arrived in Pennsylvania (ca. 1791); (3) The actual subject is Felix DOYLE, not Felix Boyle — the OCR misread the handwritten surname once (''by the said Felix Boyle his Exrs Admr or assigns'') while correctly reading ''Felix Doyle'' elsewhere in the same document. The single OCR misread is why this record appeared in the Felix Boyle full-text search. The mortgage is for John Wallace''s one-ninth interest in the Robert Baker estate (excluding widow''s one-third), pledged to Felix Doyle against a debt of £75 15s. due by 10 January 1777. A separate 1773 mortgage on same pages (Samuel Murray → John Bowman, ~200-acre Newton Township plantation on Conodoguinet Creek) is entirely unrelated.

DATES: Mortgage acknowledged: 23 May 1773. Separate Murray–Bowman deed: 25 Aug 1773.

NAMES: Felix Doyle (mortgagee — OCR also renders as ''Felix Boyle'' once in same document; same person, handwriting ambiguity between Doyle/Boyle); John Wallace (mortgagor, one-ninth interest in Robert Baker estate); Robert Baker (dec., whose estate underlies the mortgage); Samuel Murray (weaver, Newton Township — separate deed); John Bowman (yeoman, Newton Township — separate deed). Witnesses: James Ashin; Rebecca Wallan; Willot (Justice of the Peace).

LOCATIONS: Cumberland County, Pennsylvania. Newton Township (Murray–Bowman deed). Along Conodoguinet Creek.

CITED RECORDS: None — no connection to Boyle family records.

BATCH: SRCH-010'
);

-- EX-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    72,
    '1797',
    'EXCLUDED — different person and different name (OCR misread; estate inventory)',
    'Franklin County',
    'PA',
    'Estate papers: Franklin. Probate Estate Case Files 1797; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QSQ-G9SM-1NP5?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M95Q-95P',
    'EXCLUDED: Not our Felix Boyle. Three reasons: (1) Franklin County, south-central PA — our family was in Washington County, western PA; (2) 1797 — Philemon arrived in PA ca. 1791 and Felix Sr. was not born until 1813; (3) The ''Felix Boyle'' entry is almost certainly Felix DOYLE, same OCR ambiguity as EX-003. The document contains an estate inventory of livestock and goods. The name ''Felix'' appears as ''Felix Doyle,'' ''Felix Dayle,'' and ''Felix Boyle'' in the same short passage — the same individual rendered three ways by inconsistent handwriting and OCR. Similarly ''Wm Boyle'' and ''Mary Boyle'' appear alongside a cluster of Doyles (Mary, Bars, Peggy, Wm, E, Bart, Perry, Son Dayle) — all almost certainly one extended Irish family with the surname Doyle/O''Dubhghaill being read inconsistently. FamilySearch AI correctly flagged that ''names include several people surnamed Doyle/Dayle/Boyle'' but could not establish relationships. The document was flagged in the Felix Boyle search solely due to the OCR misread.

DATES: 1797 (no specific date stated in visible transcript).

NAMES: Felix Boyle (OCR variant — almost certainly Felix Doyle; see summary); Felix Doyle (also ''Felix Dayle'' and ''Felix Boyle'' in same document — same person, handwriting read three ways); Wm Boyle (OCR variant, probably Wm Doyle); Mary Boyle (OCR variant, probably Mary Doyle). Also in document: Mary Doyle (multiple entries), Bars Doyle, Peggy Doyle, Wm Doyle, E Doyle, Bart Doyle, Perry Doyle, Son Dayle (Doyle). Unrelated parties: Wm W Elheny, Saml French, Saml Baker, John Bowman, Harmon Hockenbury, John Widney, John Rowls, John Timmons, Petter Timmons, Fredrick Lowe, John Ardey, John Weston, Jas McElheny, Jas Winney, John Dury, John Harmony, Wm McCall.

LOCATIONS: Franklin County, Pennsylvania (south-central PA, near Maryland border).

CITED RECORDS: Same Doyle/Boyle OCR ambiguity pattern as EX-003 (Cumberland County, 1773). No connection to Boyle family records.

BATCH: SRCH-010'
);

-- EX-005
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-005',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    73,
    '1797',
    'EXCLUDED — different person and different name (OCR misread; second image of EX-004 estate file)',
    'Franklin County',
    'PA',
    'Estate papers: Franklin. Probate Estate Case Files 1797; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-89SM-1JQT?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M95Q-95P',
    'EXCLUDED: Not our Felix Boyle. Second image of the same Franklin County Doyle estate file as EX-004 (same collection, same item). DISAMBIGUATION VALUE: This page shows ''Felix Boyle one Logchain,'' ''Felis Doyle any Wayson,'' and ''Felix Dayle one that'' as three separate OCR renderings of the same person buying items at the same estate sale, on the same page — conclusive proof that Doyle, Boyle, and Dayle are all the same surname misread by OCR. Same applies to ''Bar Boyle,'' ''Wm Boyle,'' ''E Boyle,'' ''Barns Boyle'' appearing alongside their Doyle-rendered equivalents. The estate itself appears to be an unnamed decedent''s property being sold; an unnamed widow retained certain items. The Doyle/Boyle cluster are buyers at the sale, not heirs. File this pair (EX-004 and EX-005) as the reference case whenever Doyle→Boyle OCR ambiguity needs to be explained.

DATES: 1797 (no specific date stated in visible transcript).

NAMES: Felix Boyle (OCR variant for Felix Doyle — ''Felix Boyle one Logchain''); also on same page: ''Felis Doyle any Wayson'' and ''Felix Dayle one that'' — three OCR renderings of the same person on the same page, conclusively demonstrating the Doyle→Boyle misread pattern. Also: Bar Boyle (= Bar/Bars Doyle), Wm Boyle (= Wm Doyle), E Boyle (= E Doyle), Barns Boyle (= Bars Doyle). Other names: Samel Baker, Wm Alexander, Mary Doyle/Dayle, Sarah Doyle, Edward Doyle, John Widney, John Mechan, Ephram Donley, John Adey, John Simons, James Elkenny.

LOCATIONS: Franklin County, Pennsylvania.

CITED RECORDS: Second image of same estate file as EX-004 (same collection #005547296, Item 5, group M95Q-95P). Same Franklin County Doyle family estate, 1797.

BATCH: SRCH-010'
);

-- EX-006
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-006',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    74,
    '1844',
    'EXCLUDED — naturalization petition, different person (Irish-born Felix Boyle, Pittsburgh)',
    'Allegheny County',
    'PA',
    'Allegheny. Citizenship Records 1846–1848; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS9M-Q9TB-2?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'EXCLUDED: Not our Felix Boyle. Three reasons: (1) Irish-born — Felix Boyle Sr. (1813–1884) was born in Washington County PA to Philemon Boyle (arrived ca. 1791) and was a US citizen by birth; naturalization was never required. (2) Wrong geography — this Felix lived in Allegheny and Huntingdon Counties, not Washington County; declaration of intention filed in Centre County, nowhere near the Boyle family''s western PA footprint. (3) Signed with a MARK — illiterate or could not write; the Boyle family were consistently literate, signing their own names on deeds and legal documents throughout this period. This Felix arrived in the US approximately 1839–1842 (five years before 1847 petition), placing his departure from Ireland after Philemon''s family was already well established in Washington County. Witness Hugh Harrold not connected to any known Boyle family network.

DATES: Declaration of intention: 23 January 1844, Centre County PA. Naturalization petition and oath: 5 April 1847, Allegheny County PA.

NAMES: Felix Boyle (petitioner — Irish-born, not our Felix Sr.; signed with a MARK, not signature); Hugh Harrold of City of Pittsburgh (witness, attested to residence and good moral character); Hiram Huly (court official, subscribed as witness to oath). Prothonotary of Court of Common Pleas of Centre County (received 1844 declaration of intention).

LOCATIONS: City of Pittsburgh, Allegheny County PA (residence at time of petition). Allegheny County and Huntingdon County PA (stated prior PA residences). Centre County PA (declaration of intention, 1844).

CITED RECORDS: NR-001 (Connell Boyle naturalization, Washington County) — compare: Connell signed his own name; this Felix used a mark. No other connections to Boyle family records.

BATCH: SRCH-010'
);

-- FB-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    74,
    '1866',
    'Deed (heirs of patriarch Felix Boyle Sr. → Stephen Colvin, 63 perches, $50)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1871–1872; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89FS-S?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z7-LGJ',
    'Heirs of the patriarch sell a 63-perch Carroll Township lot to Stephen Colvin for $50, September 1866. CRITICAL NAMING CLARIFICATION: ''Felix Boyle Sr. decd'' in this deed = the patriarch Phelim/Philemon Boyle (d. 2 Jan 1841), referred to by his anglicized given name Felix. ''Felix Boyle Jr.'' who signs = Connell''s brother Felix Boyle (1813–1884), who was very much alive in 1866 and appears as ''Jr.'' relative to his father. This resolves a potential confusion: the patriarch was known in family usage as ''Felix Boyle Sr.'' while legal documents called him ''Philemon Boyle decd'' (PR-036). The four grantors are the exact sibling group from the Oct 1852 partition deed (PR-036): Felix (Jr. here), Alice, Maria/Mariah, and Alice Crosby née Boyle. The land is described as part of the patriarch''s Carroll Township tract ''conveyed to [them] by mutual division'' — referencing the 1852 PR-036 partition. Twenty-five years after the patriarch''s death, his children are still selling off small parcels from the family landholding. The $50 consideration for 63 perches is a small but real transaction. OCR: ''Maria Boyle Hill Boyle & Crosby mother of the said Alice Crosby'' is garbled text, probably ''Maria Boyle, [Alice] Boyle & [Alice] Crosby'' with OCR noise; ''Alace Boyle'' = Alice Boyle; ''Octo. 4 1811'' = October 4, 1871 (recording date). Thomas Collins as both witness and J.P. — 11 years of continuity in the Boyle legal circle (PR-022, 1855 through this deed, 1866).

DATES: Deed: 15 Sep 1866. Acknowledgment: 29 Sep 1866 before Thomas Collins J.P. Recorded: 4 Oct 1871 (OCR: ''4 Oct 1811'' — error for 1871) by John P. Charlton, Recorder, per A. Hart Dep. Recorder.

NAMES: Felix Boyle Jr. (grantor — = Felix Boyle Sr. 1813–1884, Connell''s brother and patriarch''s son; called ''Jr.'' here because he is the son of ''Felix Boyle Sr.'' = the patriarch); Alice Boyle (grantor — Connell''s sister, patriarch''s daughter); Maria Boyle (grantor — Connell''s sister = Mariah Boyle from PR-036); Alice Crosby (grantor — Connell''s sister, née Boyle, married Crosby; same person as ''Alice Crosby née Boyle'' from PR-036 and PR-017). Felix Boyle Sr. decd (named as ancestor of grantors = the patriarch Phelim/Philemon Boyle, d. 2 Jan 1841 — referred to by anglicized first name ''Felix''). Stephen Colvin (grantee, Carroll Township, $50). Witnesses/officials: Thomas Collins (witness and J.P. for Boyle deed acknowledgment); J. R. Hazzard (J.P. for unrelated Coulter deed); T. R. Haggard (J.P. for Coulter deed); John P. Charlton (Recorder); A. Hart (Deputy Recorder). Unrelated deed parties: Robert Coulter; Mary Jane Coulter; Joshua William Hornish Wright (trustee); John N. Dagg (dec., intestate); William Dagg (heir, dec.); William Harcel/Henrich (purchaser).

LOCATIONS: Carroll Township, Washington County PA. Lot of 63 perches, part of the patriarch''s Carroll Township tract (same tract as PR-036/052 family landholding).

CITED RECORDS: Same sibling group as PR-036 (Oct 1852 Philemon heirs partition deed): Alice Boyle, Maria/Mariah Boyle, Felix Boyle, Alice Crosby. The 1852 partition called the patriarch ''Philemon Boyle decd''; this 1866 deed calls him ''Felix Boyle Sr. decd'' — family usage vs. legal usage of the same man''s name. Thomas Collins as both witness and J.P.: same Collins in PR-022 (1855), PR-023 (1855), PR-035 (1864), PR-041 (1860) — 11-year continuity in the Boyle legal circle now extended to 1866. J. R. Hazzard as J.P. for Coulter deed on same pages: same Hazzard family as R. Hazzard J.P. who acknowledged PR-052 (James Boyle→Felix Boyle Sr., 1845). John P. Charlton as Recorder (successor to Cyrus Underwood). Property described as part of tract ''owned by Felix Boyle Sr. in his lifetime... conveyed to the said Felix Boyle [Jr.], Maria Boyle, [Alice] Boyle & Crosby by mutual division'' — references the 1852 PR-036 partition.

BATCH: SRCH-011'
);

-- EX-007
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-007',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    75,
    '1861',
    'EXCLUDED — deed, different person (Pittsburgh Felix Boyle, wife Sophia)',
    'Allegheny County',
    'PA',
    'Deed book, Allegheny County: Pittsburgh. Deed Books October 1861–September 1862; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ7-C927-N?view=fullText&keywords=Felix+++Boyle%2CFelix+Boyle&searchForm=simple&lang=en&groupId=M9H4-QPX',
    'EXCLUDED: Not our Felix Boyle. Three reasons: (1) Wrong county — Allegheny County / Pittsburgh; our Felix Sr. was in Washington County (Carroll and Fallowfield Townships). (2) Wrong wife — this Felix''s wife is Sophia; Felix Sr.''s wives were an unnamed first wife and Elizabeth V. Henderson (m. Feb 1873); Captain Felix (1839–1916) married Maria Anna O''Neill. No Sophia in the family. (3) Wrong property footprint — Pittsburgh Seventh Ward lot, no connection to Carroll/Fallowfield Township lands. NOTES: Felix signed his own name (literate); Sophia signed with an X (illiterate). Sophia examined separately for dower release per standard PA procedure. Nominal $10 consideration suggests a family transfer or title cleanup rather than an arm''s-length sale. Property came through a sheriff''s sale chain: William Magill (High Sheriff) → Abigail Hartford (Warren OH) → Elizabeth Tiggett (administratrix). The Pittsburgh Seventh Ward is entirely outside the Boyle family''s documented geographic footprint.

DATES: Deed date: not stated in visible fragment (earlier page). Acknowledged: 4 April 1861. Recorded: 18 November 1861.

NAMES: Felix Boyle (grantor, party of first part — signed his name, not a mark); Sophia Boyle his wife (grantor, party of first part — signed with X mark; examined separately for dower release). Grantees (party of second part): John Liggett and Sarah S. Hitchcock. Witnesses: M. McBride; J. McBride. Also on same pages (unrelated deed): Abigail Hartford of Warren, Trumbull County OH (grantor via attorney Austin Loomis); Elizabeth Tiggett of Allegheny County (administratrix of Thomas Tiggett, dec''d; grantee); Thomas Steele (Alderman, witness); William Magill (late High Sheriff, Allegheny County, prior grantor).

LOCATIONS: City of Pittsburgh, Allegheny County PA. Lot No. 32, Liggett''s Plan of Lots, Seventh Ward, Pittsburgh.

CITED RECORDS: No connection to Boyle family records. Prior deed in title chain: wife [unnamed] → Joseph Kelly, 17 May 1849. Sheriff''s deed in prior chain: William Magill (late High Sheriff, Allegheny County) → Abigail Hartford, 12 May 1855 (Deed Book Vol. 119 p.456, Allegheny County). Hartford → Elizabeth Tiggett (administratrix of Thomas Tiggett, dec''d), 23 Sept 1856.

BATCH: SRCH-010'
);

-- FB-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    75,
    '1850',
    'Quitclaim deed (Felix Boyle → Harvey Leeper, 1/8 share of Conrad Ammon estate, $312)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-473X?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'Felix Boyle Sr. (Connell''s brother, 1813–1884) quitclaims his one-eighth interest in a 50-acre Carroll Township tract (formerly Conrad Ammon estate) to Harvey Leeper for $312, August 7, 1852 — six months before the May 1853 Fitzsimmons coal transactions that dominate the Connell/John ledger. ACQUISITION AND DISPOSAL: Felix acquired this 1/8 share from Mary Kebel (one of Ammon''s heirs) by deed dated 22 November 1850; held for ~21 months; sold August 1852 for $312. Pattern consistent with Felix Sr.''s documented role as opportunistic land accumulator in Carroll Township (per PR-052, BIO-001). NETWORK CONFIRMATION: Ira R. Butler witnesses — the same Butler who witnessed Connell and John Boyle''s deeds throughout the 1840s–1860s; confirms Felix Sr. used the same legal circle as his brothers. NEIGHBORS: Sampson family (= James Sampson, James''s brother/relative, same family as coal-rights seller in PR-037) and heirs of Robert Grant dec. (= same Grant family bordering all Boyle Carroll Township land). Conrad Ammon is a new name in the network; Mary Kebel (one of Ammon''s heirs) is also new — the Ammon estate distributed shares to heirs who then sold to Boyle, who flipped his share. ''Curro Township'' = Carroll Township (OCR); ''Cornod Ammon'' = Conrad Ammon; ''Revert Grant'' = Robert Grant; ''Harvey Legner'' / ''Harvey Sep'' = Harvey Leeper (OCR).

DATES: Mary Kebel→Felix Boyle deed (title): 22 Nov 1850. Felix Boyle→Harvey Leeper quitclaim: 7 Aug 1852. Acknowledgment: 7 Aug 1852 before Ira K. [Butler] J.P. Recorded: [Jan] 1853 (OCR: ''Jany 1st 1833'' — error for 1853) by Morrison, Recorder.

NAMES: Felix Boyle (grantor — Felix Boyle Sr. 1813–1884, Connell''s brother; resident Carroll Township). Harvey Leeper (grantee, Washington County PA — also ''Harvey Legner'' OCR; ''Harvey Sep'' in receipt OCR). Mary Kebel (prior grantor to Felix Boyle, 22 Nov 1850 — one of Conrad Ammon''s heirs). Conrad Ammon dec. (''Cornod Ammon'' OCR — original owner of the 50-acre tract). Witnesses: Ira R. Butler (''Ira R. Buttler'' OCR — same Butler as Connell/John Boyle witness throughout ledger); Michael Cuyan (''Micheal Cuyan'' OCR). J.P.: ''Ira K.'' (= Ira R. Butler or a variant — taking acknowledgment same day). Morrison (Recorder). Unrelated deed: Walter Craig; John Craig; James Thompson (wit.); John Sampson (wit.); John Boyd (J.P.).

LOCATIONS: Carroll Township (''Curro Township'' — OCR error), Washington County PA. Tract: 50 acres more or less (1/8 share = ~6.25 acres), formerly Conrad Ammon estate. Adjacent: James/Harry Sampson; heirs of Robert Grant dec.

CITED RECORDS: Mary Kebel→Felix Boyle deed: 22 Nov 1850 (not yet in ledger; source deed for Felix''s title). Adjacent landowners: James/Harry Sampson (= the Sampson family from PR-037, PR-015, MG-001 — same neighbors in Carroll Township as Connell/John''s operations); heirs of Revert/Robert Grant dec. (= same Grant family appearing throughout Boyle metes-and-bounds: Robert Grant, John Grant, Ely Grant, Noah Grant). Ira R. Butler as witness: same Butler who witnessed virtually every Connell/John Boyle deed 1841–1866 — confirms Felix Sr. operated in the same legal/social circle as his brother. Craig–Craig partition deed on same pages (154 acres 25 perches, unrelated). Recording date ''Jany 1st 1833'' is OCR error for 1853.

BATCH: SRCH-011'
);

-- MR-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'MR-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'MR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    76,
    '1865',
    'General Court-Martial proceedings — General Orders No. 40, Middle Military Department (NEW PREFIX: MR- for Military Records)',
    'Fulton County',
    'PA',
    'United States. Military Records 1863–1870; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QHV-L3NL-LCDG?view=fullText&keywords=FELIx+BOYLE%2CFelix+Boyle&searchForm=simple&lang=en',
    'PRIMARY SOURCE for Captain Felix Boyle''s dishonorable discharge. General Court-Martial, Philadelphia, December 23, 1865. CHARGE: Conduct unbecoming an Officer and a Gentleman. TWO SPECIFICATIONS, both October 6, 1865, McConnellsburg PA: (1) At ''early candlelight,'' visited the house of Margaret Henry, widow, made ''proposals of an indecent character,'' and offered her $10 to comply. She refused. (2) Threatened to return to her house ''at bed time''; returned at approximately midnight and attempted to force entry into her home. PLEA: Not Guilty. FINDING: Guilty. SENTENCE: Dismissed from the service. CONTEXT: The 3d Provisional Pennsylvania Cavalry was a post-Civil War provisional unit, still active October–December 1865 for mustering-out purposes. The Civil War had ended in April 1865; Boyle was serving in a post-war capacity in south-central Pennsylvania when the offense occurred. The offense is a deliberate two-stage escalation, not impulsive: proposals at candlelight, explicit threat, then midnight return to force entry — across several hours. The $10 offer and the midnight forced-entry attempt are both in the formal specifications. NOTE ON NEW PREFIX: MR- introduced for military records. Add to ledger rules document.

DATES: Offense: on or about 6 Oct 1865, McConnellsburg PA. Court-martial convened: Philadelphia PA, pursuant to Special Orders No. 56, 20 Sep 1865. General Orders No. 40 (publishing findings): 23 Dec 1865, HQ Middle Military Department, Baltimore MD.

NAMES: Captain Felix Boyle (defendant — Captain Felix Boyle 1839–1916, Connell''s son; Company M, 3d Provisional Pennsylvania Cavalry, U.S. Volunteers). Margaret Henry (victim — widow, living in or near McConnellsburg PA; unnamed husband deceased). Brevet Major General R. O. Tyler, U.S. Volunteers (President of the General Court-Martial). Unrelated: Private James Bray (Company A, 7th U.S. Veteran Volunteers); First Sergeant William R. Williams (Company A, 7th U.S. Veteran Volunteers).

LOCATIONS: McConnellsburg, Pennsylvania (Fulton County — scene of offense; Captain Boyle stationed nearby with post-war provisional unit). Philadelphia, Pennsylvania (court-martial venue). Baltimore, Maryland (Middle Military Department HQ, issuing General Orders).

CITED RECORDS: This is the primary source for the ''dishonorably discharged for attempted rape of a widow'' entry in people/captain-felix-boyle.md and the Sept 21 2026 conversation summary. Court convened pursuant to Special Orders No. 56, HQ Middle Military Department, Baltimore, September 20, 1865. General Orders No. 40 (December 23, 1865) publishes the findings. Unrelated case on same pages: Private James Bray, Company A, 7th U.S. Veteran Volunteers, charged with striking First Sergeant William R. Williams at Fort Mifflin PA, November 21, 1865.

BATCH: SRCH-011'
);

-- NR-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'NR-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'NR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    76,
    '1870',
    'Naturalization petition — Felix Boyle as witness for Patrick O''Neill (future father-in-law)',
    'Washington County',
    'PA',
    'Naturalization records and index: Washington. Declarations of Intention 1866–1884, Naturalization Records 1866–1884, Petitions for Naturalization 1866–1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSMY-PQ1L-5?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'UNCERTAIN: Felix Boyle Sr. (1813–1884) witnesses the naturalization of Patrick O''Neill at Washington County Court of Common Pleas. Felix Sr. is the stronger candidate: Washington County Court of Common Pleas is his documented territory (Carroll/Fallowfield Twp.); he was the senior Boyle community figure in this period; Captain Felix (1839–1916) is possible but was the junior figure. The connection may run Felix Sr. → Washington County neighbor Patrick O''Neill → Captain Felix meets Maria Anna, rather than Captain Felix already knowing the O''Neills directly. Patrick O''Neill is the father of Maria Anna O''Neill (1859–1939), who would marry Captain Felix Boyle (their son Paul Mary born 1878, placing marriage ca. 1876–1878). KEY FINDINGS: (1) FELIX-O''NEILL RELATIONSHIP PREDATES MARRIAGE: Felix vouching for Patrick in court — whether as neighbor, employer, contractor connection, or already-known future father-in-law — confirms the two families were connected in Washington County before the marriage. (2) PATRICK O''NEILL''S ARRIVAL: 12 years US residence stated at time of petition (1872 or later) places Patrick''s arrival ca. 1858–1860, the same year Maria Anna was born (1859) — he may have arrived just before or just after her birth, possibly bringing a pregnant wife or an infant daughter. (3) PATRICK SIGNED WITH A MARK: Illiterate or could not write, consistent with a manual labor / contracting background. Felix signed his own name — the literacy contrast between witness and petitioner mirrors EX-006 (Irish-born Felix Boyle, Pittsburgh, who signed with a mark while his witness signed his name). (4) WASHINGTON COUNTY PLACEMENT: Confirms Captain Felix was active in Washington County community vouching network in the early 1870s, before his move to Homestead (1886). OCR: ''Patrick Oil'' = Patrick O''Neill; ''John Hain'' = John Cain (both renderings appear in same transcript).

DATES: Declaration of intention: 28 June 1870, Clerk''s Office of the Western District of Pennsylvania. Naturalization petition: date not stated in document; 2+ years after declaration, so 1872 or later. Washington County Court of Common Pleas.

NAMES: Patrick O''Neill / Patrick Oneill (petitioner — native of Ireland; signed with a MARK; stated 12 years US residence = arrived ca. 1858–1860; father of Mary Ann O''Neill who married Captain Felix Boyle; described in family records as ''pioneer grading contractor of Homestead''). Felix Boyle (witness — signed his own name; UNCERTAIN which Felix: Felix Sr. (1813–1884) is the stronger candidate per Carolyn''s assessment — he was the established Washington County community figure in this period, active in Carroll/Fallowfield Twp. through 1884, and the naturalization is in Washington County court which is his territory; Captain Felix (1839–1916) is also possible but was the junior figure at this time; the O''Neill connection may have run Felix Sr. → neighbor Patrick O''Neill → Captain Felix meets Maria Anna, rather than the reverse). John Cain / John Hain (co-witness — signed his own name; OCR renders as both Hain and Cain; not previously identified in Boyle records). Judge A.W. Ackeson (President, Washington County Court of Common Pleas).

LOCATIONS: Washington County PA, Court of Common Pleas. Western District of Pennsylvania (declaration of intention filed 1870).

CITED RECORDS: Captain Felix''s wife: Mary Ann O''Neill (1859–1939), daughter of Patrick O''Neill per conversation-summary-sept21.md — this record confirms the Felix-O''Neill family connection predates the marriage by several years. NR-001 (Connell Boyle witnesses Patrick Donaly naturalization, 1840) — same pattern: a Boyle vouching for an Irish immigrant neighbor in Washington County court. Patrick O''Neill described in memoir notes as ''pioneer grading contractor of Homestead.'' John Cain (co-witness) — not previously identified in Boyle records.

BATCH: SRCH-010'
);

-- MR-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'MR-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'MR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    77,
    '1865',
    'General Court-Martial proceedings — General Orders No. 40 (duplicate of MR-001, enclosure copy in military correspondence)',
    NULL,
    'PA',
    'Letters: United States. Guild Records 1866; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS59-8SY6-S?view=fullText&keywords=FELIx+BOYLE%2CFelix+Boyle&searchForm=simple&lang=en',
    'DUPLICATE of MR-001. Second archival copy of General Orders No. 40 (December 23 1865), same court-martial proceedings against Captain Felix Boyle. The ''ENCL'' notation at top confirms this is the copy enclosed in military correspondence — a standard practice for distributing general orders through the department''s letter system. Both copies are identical in content. The ''twofer'' nature of the orders: Felix Boyle''s case (conduct unbecoming) and Private James Bray''s case (striking a NCO + AWOL) were handled in the same session and published in the same General Orders No. 40 — Boyle sharing dismissal proceedings with a private charged with insubordination, a further indignity. See MR-001 for full analysis.

DATES: Same as MR-001. Offense: 6 Oct 1865. General Orders No. 40: 23 Dec 1865.

NAMES: Same as MR-001. Captain Felix Boyle; Margaret Henry; Brevet Major General R. O. Tyler; Private James Bray; First Sergeant William R. Williams.

LOCATIONS: Same as MR-001. McConnellsburg PA; Philadelphia PA; Baltimore MD.

CITED RECORDS: Duplicate of MR-001 (same General Orders No. 40, December 23 1865, HQ Middle Military Department). ''ENCL'' header at top of document indicates this copy was enclosed in military correspondence, explaining its presence in the Letters/Guild Records collection vs. the Military Records collection where MR-001 appears. NOTE: A lawyer''s letter advising Felix to disregard Margaret Henry''s complaint reportedly exists in related records (source outside this FamilySearch result); not yet located or logged. If found, it would establish that someone in Felix''s legal/command circle knew about the first visit before the midnight return, making the forced-entry attempt more deliberate.

BATCH: SRCH-011'
);

-- FB-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    79,
    '1875',
    'Article of Agreement (business partnership — Captain Felix buys one-third interest in Zeph M. & John Jr.''s firm, including real estate and whisky)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1875–1876; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-89PW-M?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z4-YLD',
    'MAJOR RECORD. Business partnership agreement, April 21, 1875: Captain Felix Boyle (Felix Jr.) buys a one-third interest in the family firm of Zeph M. and John Boyle Jr. TERMS: Felix furnishes $3,000 cash + assumes equal share of all firm debts + pays equal share of yearly dower to Rebecca Boyle. In return receives: (1) one-third of real estate in East Pike Run Township lately purchased from John Shanton; (2) equal interest in whisky on hand; (3) equal share of all personal property. SIGNIFICANCE: (1) WHISKY OPERATION: ''the firm of Zeph & John Boyle Jr.'' has whisky as primary personal property — almost certainly the beginning of the whisky distillery that fails ca. 1884, triggering Captain Felix''s financial collapse and political reinvention in Homestead; (2) CAPTAIN FELIX RETURNS: 8 years after the court-martial (1865) and Carroll Township land sale to brothers (1867), Felix is buying back into family enterprise with $3,000 — source of this capital unknown; (3) EAST PIKE RUN TOWNSHIP: new geographic territory for the Boyle family, south Washington County, different from Carroll/Fallowfield (north) and Homestead (Allegheny County); almost certainly purchased with Carroll Township sale proceeds (PR-043, March 1875, $15,360); (4) REBECCA''S DOWER: confirms Rebecca Ann Beall Boyle still living April 1875 and receiving a yearly dower payment from her sons — she outlived this by 24 years; (5) GENERATION CONFIRMED: Felix Jr. = Captain Felix (1839–1916); John Jr. = John D. Boyle Sr. (the Chief Burgess); Zeph M. = Zephaniah M. Boyle — all three Connell''s sons, not the next generation. OCR: ''Jeph & John Boyler'' = Zeph M. Boyle and John Boyle Jr.; ''East Pike Rum Township'' = East Pike Run Township; ''yearly dower'' probably = ''yearly dower'' (a regular cash payment to Connell''s widow from the estate).

DATES: Agreement: 21 Apr 1875. Recorded: 8 Sep 1875 by S. S. Wilson, Recorder.

NAMES: Felix Boyle Jr. (party of first part — Captain Felix Boyle, 1839–1916, Connell''s son, age ~36; returning to family business 8 years after court-martial and Carroll Township land sale). Zeph M. Boyle (party of second part — Zephaniah M. Boyle, Connell''s son). John Boyle Jr. (party of second part — John D. Boyle Sr., Connell''s son, the Chief Burgess; called ''Jr.'' to distinguish from uncle John Boyle Sr.). Rebecca Boyle (named but not a party — Connell''s widow, receiving yearly dower from estate; still living April 1875). John Allman (witness). S. S. Wilson (Recorder).

LOCATIONS: East Pike Run Township, Washington County PA (real estate subject of agreement, recently purchased from John Shanton). Signatories all of East Pike Run Township.

CITED RECORDS: Real estate ''lately purchased from John Shanton'' in East Pike Run Township = almost certainly purchased with proceeds of PR-043 (Boyle heirs→Shanton Carroll Township sale, March 1875, $15,360) — within weeks of that sale, Zeph M. and John Jr. reinvested in East Pike Run Township land, possibly from the same Shanton (who was an active land trader, per PR-045). Rebecca Boyle''s ''yearly dower'' = Rebecca Ann Beall Boyle, Connell''s widow, still alive April 1875 (consistent with her confirmed death April 1899). The ''firm of Zeph & John Boyle Jr.'' and ''whisky now on hands'' = almost certainly the beginning of the whisky distillery operation that failed ca. 1884 (per people/captain-felix-boyle.md and Sept 21 2026 session notes). David Brown→William J. Brown deed on same pages (10 acres 5 perches, Cross Creek/Independence Township, $702.18, unrelated). Henry McKee et ux→Andrew Lewis, Beallsville lots 107–110, $250 (unrelated).

BATCH: SRCH-011'
);

-- PT-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PT-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PT'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    80,
    '1884',
    'Will (Felix Boyle Sr., proved October 1884)',
    'Washington County',
    'PA',
    'Will Book: Washington. Will Books 1883–1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QSQ-G9SM-CSVV?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9HF-Q3N',
    'FOUNDATIONAL RECORD. Felix Boyle Sr.''s last will and testament, dated July 7, 1884, proved October 11, 1884 — seven days after his death on October 4, 1884. BEQUESTS: (1) To son Joseph: one-third undivided interest in the Carroll Township home farm (held until Joseph turns 21, with Elizabeth V. in full control until then); (2) To son Joseph: 30 acres of the ''John Boyle Dec''d farm,'' with authorization to sell to pay Felix''s debts; (3) To sister Alice: the mare ''Maggy''; (4) To son Joseph: the Colt; (5) To wife Elizabeth V.: all remaining personal property — cash in bank, two horses (John & Dock), one half of cattle and sheep, farm implements; (6) Desire that family continue living at the homestead ''in the same agreeable manner as at present.'' Elizabeth V. named guardian of minor Joseph AND executrix. KEY FINDINGS: (1) JOHN BOYLE SR. CONFIRMED DECEASED: ''John Boyle Dec''d farm'' establishes John Boyle Sr. (Connell''s brother) died between 1881 (PR-017, still alive) and July 1884; (2) ALICE BOYLE STILL LIVING July 1884: the patriarch''s daughter, Connell''s sister, receives the mare; (3) ONE-THIRD UNDIVIDED INTEREST: Felix Sr. held only a 1/3 share of his Carroll Township home farm — co-owners not named in will; (4) FELIX SR.''S DEBTS: explicitly acknowledged — ''debts now against me (or likely to come against me)'' — consistent with the Fallowfield land sales of Feb–Mar 1884 (FB-001) six months before death; (5) 30-ACRE JOHN BOYLE FARM PORTION: distinct from the 45-acre John Boyle tract sold to Phebe Wilson (FB-001) — confirms the John Boyle farm was larger, with Felix retaining a 30-acre portion after the February 1884 sale; (6) JOSEPH''S MINORITY: born October 1876, Joseph would be ~7 at will date; Elizabeth V. controls farm until his 21st birthday in October 1897 — she managed the estate for 13 years as widow.

DATES: Will executed: 7 Jul 1884, Carroll Township, Washington County PA. Felix Boyle Sr. died: 4 Oct 1884 (per BIO-001). Will proved: 11 Oct 1884 before John F. Cooper, Register.

NAMES: Felix Boyle (testator — Felix Boyle Sr. 1813–1884, Connell''s brother, the ''rich uncle''; described as ''Farmer, Carroll Township''). Elizabeth V. Boyle (wife, guardian and executrix — = Elizabeth V. Henderson Boyle, married Feb 1873). Joseph Boyle (son and primary heir — = Joseph James Boyle, b. 19 Oct 1876; minor at time of will). Alice (sister — = Alice Boyle, patriarch''s daughter, Connell''s sister; still alive July 1884; receives mare ''Maggy''). John Boyle dec''d (referenced as prior owner of 30-acre farm — = John Boyle Sr., Connell''s brother, Felix''s brother; confirms death between 1881 and July 1884). Witnesses: Henry P. Davis; Edward Coulter; W. H. Smith. Register: John F. Cooper.

LOCATIONS: Carroll Township, Washington County PA (Felix Sr.''s residence and farm). John Boyle Dec''d farm: also Carroll Township.

CITED RECORDS: ''Home farm'' one-third undivided interest: Carroll Township, consistent with BIO-001 (Felix Sr.''s farm). ''John Boyle Dec''d farm'' 30 acres: confirms John Boyle Sr. (Connell''s brother, Felix''s brother) deceased by July 1884; he was alive in 1881 (PR-017); death window 1881–1884. The 30-acre John Boyle farm portion is DISTINCT from the 45-acre John Boyle tract sold to Phebe Wilson in Feb 1884 (FB-001) — Felix retained a separate 30-acre portion, consistent with the John Boyle farm being larger than the 45-acre FB-001 parcel. Sister Alice = Alice Boyle (patriarch''s daughter, Connell''s sister, from PR-036 and FB-002) — confirmed still alive July 1884. Son Joseph = Joseph James Boyle (b. 19 Oct 1876 per BIO-001, age ~7-8 at will date; turns 21 Oct 1897, when Elizabeth V.''s control of farm ends). Elizabeth V. Boyle = Elizabeth V. Henderson Boyle, Felix Sr.''s second wife (married Feb 1873 per BIO-001; paid for 1893 Beers biography as widow). Debts noted: ''debts now against me (or likely to come against me)'' — Felix Sr. financially stressed at death, consistent with selling Fallowfield land to Phebe Wilson six months earlier (FB-001). Nancy Sawhill will on preceding pages (unrelated — proved same day, 10 Oct 1884; bequests to Missionary societies and sister Mary McLain; executor Alexander K. Craig).

BATCH: SRCH-011'
);

-- FB-005
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-005',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    82,
    '1867',
    'Quitclaim deed (Captain Felix → Zeph M. & John Boyle, one-fourth of 100-acre O''Hara parcel, $1,250)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1867–1868; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-8742?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z7-K16',
    'COMPANION TO PR-047. Captain Felix Boyle quitclaims his undivided one-fourth interest in the 100-acre Carroll Township parcel (the former O''Hara parcel, PR-025) to brothers Zeph M. and John Boyle for $1,250, April 13, 1867 — same month as the PR-047 divestiture of the 67-acre Rabe parcel ($3,770). Together these two April 1867 deeds constitute Captain Felix''s complete Carroll Township exit: Rabe parcel + O''Hara one-fourth = $5,020 total received. TITLE CHAIN: The 100-acre parcel traces back through John Boyle Sr.→Connell Boyle (Mar 1857, PR-013); Captain Felix received his one-fourth share as heir and administrator of Connell''s estate (1861, PR-044). EXPLAINS PR-043: Captain Felix absent from the 1875 Boyle heirs→Shanton sale because he had already conveyed his interest eight years earlier in this deed. ''Joseph M. Boyle'' in AI summary and OCR = Zephaniah M. Boyle — ''Zeph'' in period cursive produces ''Beph,'' ''Seph,'' ''Joseph'' OCR variants consistently throughout the ledger. OCR date errors: acknowledgment ''3 April 1862'' and recording ''April 18 1861'' both = April 1867.

DATES: Deed: 13 Apr 1867. Acknowledgment: ''3rd day of April 1862'' (OCR error for April 1867). Recorded: ''April 18 1861'' (OCR error for April 18, 1867) by M.L.A. McCracken, Recorder.

NAMES: Felix Boyle Jr. (grantor — Captain Felix Boyle, 1839–1916, age ~28, divesting all Carroll Township interests). Zeph M. Boyle (co-grantee — OCR renders as ''Joseph M. Boyle,'' ''Beph M. Boyle,'' ''Seph M. M. Boyle''; all = Zephaniah M. Boyle, Connell''s son). John Boyle (co-grantee — John D. Boyle Sr., Connell''s son, the Chief Burgess). Prior grantor in title chain: John Boyle [Sr.] (Connell''s brother, March 1857 deed to Connell, PR-013). J.L. Judson (witness and J.P. — same Judson as Councilman under John D. Boyle 1869). M.L.A. McCracken (Recorder).

LOCATIONS: Carroll Township, Washington County PA. One-fourth undivided interest in 100 acres 100 perches. Adjacent: heirs of George Grant dec., William Wickerham, James Sampson.

CITED RECORDS: Title chain: ''conveyed to Boyle by John Boyle by deed dated 17th day of March [1857]'' Book S [S] [Vol.E] Page 29[3] — OCR errors for ''March 7, 1857, Book SS Vol.E p.293'' = PR-013 (John Boyle Sr.→Connell Boyle quitclaim, 100-acre O''Hara parcel, $1 nominal). Captain Felix as Connell''s estate administrator (PR-044) would have taken a one-fourth share of this parcel upon Connell''s death (1861); now selling that share to his brothers. Neighbors: heirs of George Grant dec., William Wickerham, James Sampson — same as PR-043 (1875 Boyle heirs→Shanton sale of same 100-acre parcel). This deed explains why Captain Felix does NOT appear in PR-043: he had already conveyed his interest here in April 1867, eight years before the 1875 sale. COMPANION DEED to PR-047 (Felix→Zeph M. & John, 67-acre Rabe parcel, $3,770, same month April 1867 — same grantees, same deed book) — together they constitute Captain Felix''s complete Carroll Township divestiture. J.L. Judson as both witness and J.P.: same Judson who served as Councilman under Chief Burgess John D. Boyle (Connell''s son) in 1869 (per Creigh''s History) — civic and legal networks identical. Unrelated deed on same pages: Elizabeth McConnell→George Cunningham, 2 acres Jefferson Township, $90, Sep 1866.

BATCH: SRCH-011'
);

-- EX-008
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-008',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    83,
    '1867',
    'EXCLUDED — exact duplicate of FB-005 (FamilySearch double-indexed)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1867–1868; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-8742?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z7-K16',
    'EXCLUDED: Exact duplicate of FB-005. Same URL, same group ID, same image, same transcript. FamilySearch returned this result twice in the SRCH-011 batch. FamilySearch AI summary renders ''Beph/Seph M. Boyle'' as ''[Joseph?] M. Boyle'' — same OCR confusion we caught in FB-005; confirmed Zephaniah M. Boyle throughout.

DATES: Same as FB-005. Deed: 13 Apr 1867.

NAMES: Same as FB-005.

LOCATIONS: Same as FB-005. Carroll Township, Washington County PA.

CITED RECORDS: Exact duplicate of FB-005 — same URL, same group ID (M9Z7-K16), same image 51 of 341. FamilySearch indexed twice. No new content.

BATCH: SRCH-011'
);

-- EX-009
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-009',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    84,
    '1861',
    'EXCLUDED — deed (warranty, Felix & Sophia Boyle → John Liggett & Sarah S. Hitchcock, $10 consideration)',
    'Allegheny County',
    'PA',
    'Deed book, Allegheny County: Pittsburgh. Deed Books October 1861–September 1862; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJM-MR89?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZS-4KM',
    'EXCLUDED: Different Felix Boyle. Disqualifying factor: wife is Sophia Boyle — none of our three Felixes had a wife named Sophia (patriarch married Ann Rice; Felix Sr. married Elizabeth V. Henderson Feb 1873; Captain Felix married Mary Ann O''Neill). $10 nominal consideration and Pittsburgh address with Sophia signing by mark (''X'') consistent with a working-class Irish Pittsburgh family unconnected to the Carroll Township landowners. April 1861 date is also problematic: Captain Felix (age ~22) was months away from his Civil War enlistment; Felix Sr. (age ~48) was operating in Carroll/Fallowfield Township. Second deed on same pages (Hartford→Tiggett, Lot No. 32, Seventh Ward Pittsburgh, 1856) is entirely unrelated to Boyle family.

DATES: Deed acknowledged: 4 Apr 1861. Recorded: 18 Nov 1861. Second deed on same pages (Hartford→Tiggett): 23 Sep 1856, recorded 18 Nov 1861. Prior deeds recited: sheriff''s deed Magill→Hartford, 12 May 1855; Kelly deed, 17 May 1849.

NAMES: Felix Boyle (grantor, Pittsburgh — NOT our Felix Boyle; see summary); Sophia Boyle his wife (grantor; signed by mark ''X''; separately examined). Grantees: John Liggett and Sarah S. Hitchcock ($10). Witnesses: M. McBride (Boyle deed); J. McBride (receipt). Second deed (unrelated): Abigail Hartford of Warren, Trumbull County OH (grantor, by atty-in-fact Austin Loomis); Elizabeth Tiggett (grantee, administratrix of Thomas Tiggett dec.); William Magill (late High Sheriff, Allegheny County, prior grantor 1855); Thomas Steele/Steel (witness and Alderman, Hartford deed).

LOCATIONS: Pittsburgh, Allegheny County PA. Second deed: Lot No. 32, Seventh Ward of Pittsburgh, Liggett''s/Tiggett''s Plan of Lots (prior deed Deed Book Vol. 119 p. 456).

CITED RECORDS: None — no connection to Boyle family records.

BATCH: SRCH-011'
);

-- EX-010
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-010',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    85,
    '1861',
    'EXCLUDED — exact duplicate of EX-009 (FamilySearch double-indexed)',
    'Allegheny County',
    'PA',
    'Deed book, Allegheny County: Pittsburgh. Deed Books October 1861–September 1862; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ7-C927-N?view=fullText&keywords=Felix+++Boyle%2CFelix+Boyle&searchForm=simple&lang=en&groupId=M9H4-QPX',
    'EXCLUDED: Exact duplicate of EX-009. Same image (24 of 328), same Pittsburgh deed, same Felix & Sophia Boyle. FamilySearch returned this result twice in the SRCH-011 batch under different ARK identifiers and groupIds. Not our Felix Boyle for the same reasons as EX-009 (wife named Sophia; $10 consideration; Pittsburgh working-class family).

DATES: Same as EX-009. Deed acknowledged: 4 Apr 1861. Recorded: 18 Nov 1861.

NAMES: Same as EX-009. Felix Boyle; Sophia Boyle his wife; John Liggett; Sarah S. Hitchcock; Abigail Hartford; Elizabeth Tiggett; Austin Loomis; Thomas Steele.

LOCATIONS: Pittsburgh, Allegheny County PA.

CITED RECORDS: Exact duplicate of EX-009 (same image, same Felix & Sophia Boyle Pittsburgh deed). Different ARK ID (3Q9M-CSJ7-C927-N vs 3Q9M-CSJM-MR89) and different groupId (M9H4-QPX vs M9ZS-4KM) — FamilySearch double-indexed image 24 of 328 in this collection.

BATCH: SRCH-011'
);

-- EX-011
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-011',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    86,
    '1884',
    'EXCLUDED — duplicate image of FB-001 Deed 1 (warranty/acknowledgment page)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ3-NH2J?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-SMS',
    'EXCLUDED: Duplicate image of FB-001, Deed 1 (Felix & Elizabeth Boyle → Phebe Wilson). This image shows the warranty clause, signatures, dower examination of Elizabeth Boyle, JP acknowledgment, and recording notice — the pages not visible in FB-001''s image. NEW INFORMATION: (1) Deed 1 witnesses are John Holland and Morton Black — FB-001 had incorrectly attributed Holland solely to Deed 2; he served as both witness and JP for Deed 1 as well; (2) Morton Black is a new name in the Boyle legal circle — the Black family has appeared as witnesses to Boyle Carroll Township transactions from 1801 (Samuel Black, PR-054) through 1845 (Ross and Marcus Black, PR-052), now to 1884; (3) Consideration reads ''Two Thousand Seven Hundred and Thirty nine 170 Dollars'' — OCR garble consistent with $2,739.20 in FB-001; (4) Recording date confirmed: May 6, 1884 (consistent with FB-001). FB-001 updated to add Morton Black and correct Holland''s role in Deed 1.

DATES: Same as FB-001. Deed: 28 Feb 1884. Acknowledged: 28 Feb 1884 before John Holland JP. Recorded: 6 May 1884 by Work Hughes Jr.

NAMES: Felix Boyle (grantor); Elizabeth Boyle his wife (grantor — signed, separately examined). Phebe Wilson (grantee). Witnesses DEED 1 (NEW — not in FB-001): John Holland (witness AND JP for acknowledgment — same Holland as PR-043 Monongahela City Alderman); Morton Black (co-witness — Black family recurring in Boyle legal network: Samuel Black witnessed 1801 Rice→Philemon deed PR-054; Ross and Marcus Black witnessed 1845 sibling partition PR-052). Work Hughes Jr. (Recorder). Unrelated deeds on same pages: Anna Maria Phillips→Nancy M. Grounds, Franklin Township, $80, 3 May 1884; W.W. Smith→William B. Milne, Borough of Washington lot, 28 Jun 1882 (prior chain: Wishart estate→John E. Bell 1864; Bell→Julia A. Bell by will Dec 1874; Julia A. Bell→Smith 17 Jan 1882, Deed Book T Vol.3 p.257).

LOCATIONS: Washington County PA (Fallowfield Township property, described on earlier pages). Acknowledgment taken in Washington County.

CITED RECORDS: Duplicate image of FB-001 (Deed 1: Felix & Elizabeth Boyle → Phebe Wilson, $2,739.20, 28 Feb 1884). Same collection, same groupId (M9ZH-SMS). FB-001 was a different image showing the property description pages; this image (124 of 330) shows the warranty clause, signatures, acknowledgment, and recording notice.

BATCH: SRCH-011'
);

-- BIO-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'BIO-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'BIO'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    87,
    '1862',
    'Published county history — Civil War military roster, Company E, Independent Cavalry, 185th Regiment (22d Pennsylvania Cavalry)',
    NULL,
    'PA',
    'Washington. History Records (Washington County PA published history); via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSZX-7416?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9RW-G6K',
    'MAJOR RECORD. Washington County published history military roster for Company E, Independent Cavalry, 22d Pennsylvania Cavalry — Captain Felix Boyle''s unit. CAPTAIN FELIX''S TIMELINE CONFIRMED: elected 2d Lieutenant February 12, 1863; promoted to 1st Lieutenant (date not given); elected Captain March 19, 1865; company mustered out July 19, 1865. CRITICAL FINDINGS: (1) JOHN BOYLE JR. IN PRIVATES LIST — Connell''s son and future Chief Burgess of Washington Borough served as a private in the same company as his brother Captain Felix; the brothers served together throughout the war; (2) SAMUEL BLACK IN PRIVATES LIST — confirms the multi-generational Black-Boyle connection extends to Civil War service together; Samuel Black mustered out July 19, 1865 alongside John Boyle Jr. in the same company (confirming people-and-family-history.md note); (3) MARTINSBURG TWICE in battle list — consistent with family oral tradition of Captain Felix being ''wounded at Martinsburg''; two separate engagements give two opportunities for the wound; (4) ELEVEN-WEEK COLLAPSE: mustered out honorably as Captain July 19, 1865 — offense against Margaret Henry October 6, 1865 — dismissed from service December 23, 1865. Whatever was happening psychologically in those eleven weeks is undocumented; (5) HIRAM MYERS as corporal in same company — same Myers family as the Carroll Township land transaction (PR-017); (6) JAMES S. WICKERSHAM as private — Wickersham family from adjacent Boyle Carroll Township landholdings. The ''Ringgold Cavalry'' name in family tradition refers to the 22d Pennsylvania Cavalry regiment as a whole; Company E was one of its companies.

DATES: Company E mustered in: 13 Oct 1862, Wheeling VA. Felix Boyle elected 2d Lieutenant: 12 Feb 1863 (replacing R.S.H. Keys, honorably discharged). Felix Boyle elected Captain: 19 Mar 1865 (replacing J.Y. Chessround). Company E mustered out: 19 Jul 1865.

NAMES: Captain Felix Boyle (2d Lieutenant Feb 1863; 1st Lieutenant by promotion; Captain Mar 1865; mustered out Jul 1865 — Captain Felix Boyle 1839–1916). Milton W. Mitchenor (original Captain, honorably discharged Apr 1864). James Y. Chessround (1st Lieutenant then Captain Apr 1864–Mar 1865). R.S.H. Keys (original 2d Lieutenant, honorably discharged Feb 1863). James Gibson (1st Lieutenant after Felix''s promotion). Clinton Teeple (Orderly Sergeant; elected 2d Lieutenant Mar 1865). PRIVATES NOTABLE: John Boyle Jr. (Connell''s son, future Chief Burgess — served as private in same company as brother Captain Felix); Samuel Black (Black family, multi-generational Boyle neighbor/ally); also: Hiram Myers (same Myers family as PR-017 Carroll Township transaction); James S. Wickersham (Wickersham family from adjacent Boyle landholdings).

LOCATIONS: Mustered in: Wheeling, Virginia. Battles across the Shenandoah Valley / western Virginia theater: Stumps'' Mills, Moorfield, Winchester, Pergetsville, N. Mountain Depot, Petersburg, Williamsport, Burlington, Romney, Lost River Gap, Piedmont, Rockfish Gap, Lynchburg, Lexington, Salem, Dorcasville, Pleasant Valley, Monterey, Taylorstown, Snicker''s Gap, Ashley''s Gap, Kearnstown, Martinsburg (twice), Opequan Creek, Berryville, Charlestown, Stephenson Depot, Bunker Hill, Strasburg, Fisher''s Hill, Mount Jackson, Brown''s Gap, Mount Vernon Forge, Cedar Creek.

CITED RECORDS: Confirms and extends people-and-family-history.md entry for Captain Felix (Company E, 22d Pennsylvania Cavalry). MR-001 and MR-002 (court-martial, October–December 1865): eleven weeks after honorable muster-out as Captain, July 19 1865. Samuel Black in privates list: same Black family as BIO-001 (comrade Black saved patriarch on New Orleans flatboat) and people-and-family-history.md (Samuel Black Sr. settled Williamsport same time as Phelim; Samuel Black Jr. mustered out July 19 1865 alongside John Boyle Jr.) — now confirmed in same company roster. John Boyle Jr. in privates list: Connell''s son, future Chief Burgess of Washington Borough (1868–1869) — served as private while his brother Felix was promoted to Captain. Martinsburg appears twice in battle list: consistent with family oral tradition of Captain Felix being ''wounded at Martinsburg'' (people-and-family-history.md). Patton Cavalry Company (Company F, Ringgold Battalion) on same pages: explains ''Ringgold Cavalry'' as the regiment''s popular name for the 22d Pennsylvania Cavalry as a whole.

BATCH: SRCH-011'
);

-- EX-012
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-012',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    87,
    '1845',
    'EXCLUDED — duplicate of PR-052 (same ARK ID, different search parameters)',
    'Washington County',
    'PA',
    'Washington. Deeds 1845–1846; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-S7WW?view=fullText&keywords=Felix+Boyle%2CBoyle&searchForm=simple&lang=en',
    'EXCLUDED: Same document as PR-052. Appeared in SRCH-011 (Felix Boyle keyword search) because Felix Boyle is the grantee; previously retrieved in SRCH-004 (Philemon Boyle search) and logged as PR-052. James Boyle (grantor) is the youngest of Phelim''s seven children per BIO-001 birth order (Alice, Connell, John, Esther/Mrs. Crosby, Maria, Felix Sr., James); he sells his one-seventh share of the Rice–Philemon Boyle Carroll Township land to his brother Felix Sr. for $263, May 1845. No new content beyond PR-052.

DATES: Same as PR-052. Deed: 24 May 1845. Recorded: 26 May 1845 by James Brown.

NAMES: Same as PR-052. James Boyle (grantor); Felix Boyle (grantee); Ross Black and Marcus Black (witnesses); R. Hazzard (JP); James Brown (Recorder). Document also contains unrelated Vernon JP oath (26 May 1845) and McConnell executors → John McConnell Hanover Township deed (8 Sep 1831).

LOCATIONS: Same as PR-052. Washington County PA.

CITED RECORDS: Exact same document as PR-052 (James Boyle → Felix Boyle, one-seventh share, 24 May 1845). Same ARK ID (3Q9M-CSFM-S7WW); different URL parameters because PR-052 was retrieved via SRCH-004 (Philemon Boyle search) and this result via SRCH-011 (Felix Boyle search).

BATCH: SRCH-011'
);

-- PR-057
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PR-057',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    89,
    '1883',
    'Quitclaim deed (Connell Boyle''s heirs → Bishop of Pittsburgh in trust for Transfiguration Church, Monongahela City — Catholic church and cemetery parcel)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1882–1883; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJS-7JT4?view=fullText&keywords=Felix+Boyle%2CBoyle+%E2%84%97+Felix+Boyle%2CBoyle+Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-9YK',
    'FIRST PRIMARY SOURCE DOCUMENTING BOYLE FAMILY CATHOLIC FAITH. Connell Boyle''s heirs quitclaim a 144-perch Carroll Township parcel to the Bishop of Pittsburgh in trust for Transfiguration Church of Monongahela City, January 26, 1883, for $1 nominal consideration plus ''feeling an interest in the welfare of said Church.'' KEY FINDINGS: (1) TRANSFIGURATION CHURCH PARISH CEMETERY — NOT THE FAMILY PLOT: The deed transfers Carroll Township land already in use ''as at present'' as a burial ground to the church as its parish cemetery. This is DISTINCT from the Boyle Family Cemetery on the original farm, which has approximately 9 graves and is a small private family plot. Two separate burial sites exist: the ~9-grave family cemetery on the farm, and this parish cemetery land now transferred to Transfiguration Church. (2) TRANSFIGURATION CHURCH, MONONGAHELA CITY: The Boyle family''s parish church, now documented in a primary source. Bishop John Tuigg (1876–1889) is the grantee — OCR renders his name as ''Grigg'' and ''Gaigg.'' (3) REBECCA BOYLE ALIVE JANUARY 1883: Signs with mark; she died April 1899, so still 16 years from death. (4) MARY ANN O''NEILL SIGNS BY MARK: Captain Felix''s wife, age ~24, signed by mark — possibly illiterate; notable for a woman of her generation in western PA. (5) ZEPHANIAH AND JOHN BOYLE JR. ARE BROTHERS, NOT SPOUSES: AI summary error — the deed lists them as two separate co-grantors, both Connell''s sons; Zephaniah signs by mark (''Tephench Boyle ℗''). (6) D.O. LAMBERT FOURTH APPEARANCE: Daniel O.C. Lambert witnesses again in 1883, 26 years after first appearing in the Boyle legal circle (PR-013, 1857). (7) ANNE McGURGAN IN HAYNESBURGH, GREENE COUNTY: Connell''s daughter has relocated outside Washington County. (8) ''LAND OF FELIX BOYLE'' IN METES AND BOUNDS: Felix Sr.''s Carroll Township farm is the adjacent property to the south; he was still alive and the farm was still his in January 1883, nine months before his death. (9) ''ALL OF COAL PETRO WASHINGTON COUNTY PENNSYLVANIA'': Garbled OCR of grantors'' stated residence; ''Coal Petro'' is likely ''Carroll Township'' or similar; underlying text unclear without image inspection. OCR: ''Right Rev. J. Gaigg''/''J. Grigg'' = Bishop John Tuigg; ''Tephench Boyle'' = Zephaniah Boyle; ''Transfiguration'' rendered as ''Gransfiguration'' once; ''John Bogle'' = John Boyle (receipt); ''Gelix Boyle'' = Felix Boyle (receipt).

DATES: Deed: 26 Jan 1883. Power of attorney (Walton, Johnson, Paul, Baker families, unrelated): 6 Feb 1883. Iowa acknowledgment (Phebe Horn): 13 Jan 1883. Transcript cuts off before Boyle parties'' acknowledgment clause. Recorded: Work Hughes Jr., Recorder (date not visible in this image).

NAMES: GRANTORS (Connell Boyle''s heirs): Rebecca A. Boyle (Connell''s widow — signed by mark; still alive Jan 1883, age ~63); Felix Boyle Jr. and Mary Ann his wife (Captain Felix 1839–1916 and Mary Ann O''Neill 1859–1939 — Mary Ann signed by mark, age ~24; NOTE: AI summary incorrectly reads ''John Boyle Jr. and Zephaniah Boyle'' as husband and wife — they are brothers, both Connell''s sons); John Boyle Jr. (John D. Boyle Sr., Connell''s son, the Chief Burgess); Zephaniah Boyle (Zephaniah M. Boyle, Connell''s son — OCR: ''Tephench Boyle ℗''; signed by mark); Frank McGurgan and Anne his wife (Anne McGurgan née Boyle, Connell''s daughter, now of Haynesburgh, Greene County). GRANTEE: Right Rev. J. Grigg/Gaigg, Bishop of Pittsburgh (= almost certainly Bishop John Tuigg, Bishop of Pittsburgh 1876–1889; ''Grigg/Gaigg'' = OCR garble of ''Tuigg''), in trust for Transfiguration Church, Monongahela City PA. Witnesses: D.O. Lambert (= Daniel O.C. Lambert — FOURTH documented appearance in Boyle legal circle: PR-013 1857, FB-002 1866, PR-017 1881, now 1883 — 26-year continuity); Simon Rinehart (also witnessed PR-017 1881). Adjacent landowner: Felix Boyle (= Felix Sr., still alive, Carroll Township farm adjoins this parcel from the south). Recorder: Work Hughes Jr.

LOCATIONS: Carroll Township, Washington County PA (cemetery/church parcel). Grantors stated as ''All of Coal Petro Washington County Pennsylvania'' (OCR-uncertain — probably ''Carroll Township'' or similar; see summary). Anne McGurgan stated as resident of Haynesburgh, Greene County PA (new — family has expanded outside Washington County). Transfiguration Church, Monongahela City PA (beneficiary). Pittsburgh PA (Bishop Tuigg/Grigg''s jurisdiction).

CITED RECORDS: FB-001/PT-001: Felix Sr.''s Carroll Township farm adjacent to this parcel (''land of Felix Boyle'' in metes and bounds; Felix Sr. still alive Jan 1883, died Oct 4 1884). PR-017 (1881 Myers quitclaim): same Connell Boyle heirs group; Simon Rinehart also a witness there. FB-004 (Apr 1875): Captain Felix and brothers in East Pike Run Township whisky operation. PR-043 (Mar 1875): same heirs group sold Carroll Township surface to Shanton, $15,360. Charleroi Area Historical Society: cleaned gravestone — likely the ~9-grave Boyle Family Cemetery on the original farm, a separate site from this parish cemetery parcel.

BATCH: SRCH-011'
);

-- EX-013
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-013',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    90,
    '1852',
    'EXCLUDED — duplicate of PR-036 (same ARK ID, different search parameters)',
    'Washington County',
    'PA',
    'Washington. Deeds 1851–1853; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-4QFY?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'EXCLUDED: Same document as PR-036. Appeared in SRCH-011 (Felix Boyle keyword search) because Felix Boyle is a grantor/acknowledging party; previously retrieved in SRCH-002 (Connell Boyle search) and logged as PR-036. Dominant OCR variant in this image: ''Boyle'' → ''Boile'' throughout. Minor new detail: Mariah Boyle appears to have signed her name in the witness/signing list rather than using a mark, while Alice Boyle signed by mark — suggests Mariah was literate. No new substantive content beyond PR-036.

DATES: Same as PR-036. Deeds: 28 Oct 1852. Felix Boyle acknowledgment: 29 Oct 1852. Recorded: 25 Apr 1853.

NAMES: Same as PR-036. OCR NOTE: This image renders ''Boyle'' consistently as ''Boile'' throughout — a new OCR variant not previously noted. Also renders ''Connell'' as ''Collin/Collins/Corn.'' Minor additions over PR-036: ''Maria Boyle'' appears in the witness/signing list for the coal deed (John Freeman and Elizabeth Freeman are the other witnesses) — she may have signed her name rather than a mark, suggesting literacy, while Alice Boyle signed by mark (''Allis that Drill ℗''). Receipt signed by ''C. I. Boyle'' (= Connell Boyle, OCR).

LOCATIONS: Same as PR-036. Fallowfield Township, Washington County PA. Philemon Boyle farm, 123½ acres.

CITED RECORDS: Exact same document as PR-036 (Philemon Boyle heirs partition, 28 Oct 1852 — two simultaneous deeds: coal privileges to Connell & John; two-sevenths farm surface to Alice, Mariah, Felix, Alice Crosby). Same ARK ID (3Q9M-CSNL-4QFY); different URL parameters because PR-036 was retrieved via SRCH-002 (Connell Boyle search) and this result via SRCH-011 (Felix Boyle search).

BATCH: SRCH-011'
);

-- NR-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'NR-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'NR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    91,
    '1835',
    'UNCERTAIN — naturalization declaration of intention; possibly Phelim/Felix P. Boyle the patriarch (1768–1841)',
    'Allegheny County',
    'PA',
    'Allegheny. Citizenship Records 1828–1837; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSM1-D7SN-P?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'UNCERTAIN: Declaration of intention to become a US citizen, filed by Felix Boyle, native of Ireland, Pittsburgh, October 12 1835. Renounces allegiance to ''the King of Great Britain and Ireland'' — correctly William IV in October 1835 (reigned 1830–1837). IDENTITY QUESTION: The only Felix Boyle in the family who was (a) actually born in Ireland and (b) alive in 1835 is the patriarch Phelim/Felix Philemon Boyle (1768–1841). Felix Sr. (born 1813, Carroll Township PA) and Captain Felix (born 1839) were not Irish-born. IF THIS IS PHELIM: (1) He waited 44 years after emigrating ca. 1791 to file his declaration; (2) He died January 2 1841 — only 5 years after this declaration, and the 2-year waiting period to file the final petition would have made him eligible from 1837; if he never filed the final petition, his children were never derivatively naturalized; (3) This directly explains why Felix Sr. needed to naturalize in 1847 (NR-002) despite being born in Pennsylvania — his father may have died as an alien; (4) Phelim was known in legal documents and family usage as ''Felix Boyle'' (BIO-001, FB-002), so the signature ''Felix Boyle'' is consistent. CAUTION: Felix Boyle is not a rare Irish name; Pittsburgh had a substantial Irish Catholic community in 1835; an unrelated Irish Felix Boyle is possible. CAROLYN''S NOTE: Felix Boyle''s signature here has a visible family resemblance to Carolyn''s own signature, which crystallized through repetitive signing in a bank setting. RESEARCH NOTE: Search for a final naturalization petition by Felix/Phelim Boyle in Allegheny County or Washington County 1837–1841; if none exists, this is likely the patriarch who died before completing the process.

DATES: Declaration of intention filed: 12 Oct 1835 (Monday), Pittsburgh, Allegheny County PA. Sworn and subscribed: 10 Oct 1835.

NAMES: Felix Boyle (declarant — identity UNCERTAIN; see summary; described as native of Ireland, subject of King of Great Britain and Ireland). Henry H. Peterson (Prothonotary, Court of Common Pleas, Allegheny County — AI summary suggests ''Pittman'' from OCR but image reads ''Peterson''; transcript ends ''Henry H. Pittman Pro'' — OCR uncertain on surname).

LOCATIONS: City of Pittsburgh, Allegheny County PA.

CITED RECORDS: NR-002: Felix Boyle Sr. (1813–1884) naturalized Allegheny County Apr 1847, declaring Centre County intention Jan 1844 — if this 1835 record IS Phelim and he died without completing naturalization, that explains why Felix Sr. needed to naturalize despite being Pennsylvania-born. BIO-001 (Beers 1893): patriarch referred to throughout as ''Felix Boyle'' (not Philemon or Phelim) — he would have signed as ''Felix Boyle.'' FB-002 (1866 deed): patriarch called ''Felix Boyle Sr. decd'' by his own children — confirms Felix was his working given name in legal contexts. Phelim died 2 Jan 1841 (BIO-001) — only 5¼ years after this declaration; if he filed the final petition it has not yet been found; if he died before filing it, his children''s citizenship status was left unresolved.

BATCH: SRCH-011'
);

-- EX-014
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-014',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    92,
    '1867',
    'EXCLUDED — duplicate of PR-047 (same ARK ID and groupId, different search parameters)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1867–1868; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-874Y?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z7-K16',
    'EXCLUDED: Same document as PR-047. Appeared in SRCH-011 (Felix Boyle keyword search); previously retrieved in SRCH-002 (Connell Boyle search) and logged as PR-047. The ''1861'' date error in the acknowledgment clause — noted in PR-047 as an OCR error — appears consistently in both image passes, suggesting it originates in the clerk''s handwriting rather than OCR noise. No new substantive content.

DATES: Same as PR-047. Deed: [17th?] Apr 1867. Acknowledged: 13 Apr 1867. Recorded: 18 Apr 1867.

NAMES: Same as PR-047. Felix Boyle Jr. (grantor); Zeph M. Boyle and John Boyle (grantees). OCR NOTE: Acknowledgment date reads ''1861'' in both images — consistent across PR-047 and this image, consistent across both image passes, suggesting the underlying handwriting is ambiguous rather than a pure OCR artifact \u2014 a 7 without its crossbar reads as a 1, particularly in fast clerk handwriting.

LOCATIONS: Same as PR-047. Carroll Township, Washington County PA.

CITED RECORDS: Exact same document as PR-047 (Felix Boyle Jr. → Zeph M. & John Boyle, 67-acre Carroll Township surface, $3,770, 13 Apr 1867). Same ARK ID (3Q9M-CSNT-874Y) and same groupId (M9Z7-K16); different URL parameters because PR-047 was retrieved via SRCH-002 (Connell Boyle search) and this via SRCH-011 (Felix Boyle search). Note: groupId M9Z7-K16 also covers FB-005/EX-008 (different ARK: 3Q9M-CSNT-8742), the companion O''Hara parcel deed from the same deed book.

BATCH: SRCH-011'
);

-- WL-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'WL-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'WL'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    93,
    '1878',
    'Legal witness record — Captain Felix Boyle as deed witness, Washington County 1878',
    'Washington County',
    'PA',
    'Deed book, Washington County: Washington. Deed Books 1880–1881; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJS-QWYG?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-9RL',
    'Captain Felix Boyle (Felix Boyle Jr., 1839–1916) appears as witness to a deed between unrelated parties — Isaac Ledbetter and S.F. Jackman (assignees of Azariah Crow) conveying a lot of ground to A.F. Conaway for $90, acknowledged September 2 1878 at Greenfield, Washington County PA. The Boyle family has no interest in the transaction. KEY NOTES: (1) PLACES CAPTAIN FELIX IN WASHINGTON COUNTY SEPT 1878: Consistent with his involvement in the East Pike Run Township whisky distillery business (FB-004, from Apr 1875); the distillery will fail ca. 1884 and he will move to Homestead; this witness appearance confirms he was still embedded in Washington County community life in 1878. (2) D.O. LAMBERT CO-WITNESSES: Daniel O.C. Lambert''s fifth documented appearance in the Boyle legal circle, filling the chronological gap between 1866 (FB-002) and 1881 (PR-017). Complete Lambert sequence now confirmed: 1857 (PR-013), 1866 (FB-002), 1878 (this record), 1881 (PR-017), 1883 (PR-057) — 26 years of continuous presence. LAMBERT CONFIRMED AS JUSTICE OF THE PEACE via companion deed WL-004 (same sale, same day): ''D. O. Lambert... J.P.'' at the acknowledgment clause. His recurring appearances across 26 years were in his official capacity as JP, not community favors \u2014 exact parallel to Ira R. Butler''s dual witness/JP role in the Connell Boyle records. (3) GREENFIELD: Washington County township; Captain Felix''s presence there as a community witness indicates local standing and network beyond Carroll/Fallowfield Township.

DATES: Deed witnessed by Felix Boyle Jr.: executed prior to 2 Sep 1878. Acknowledged: 2 Sep 1878, at Greenfield, Washington County PA. Recorded: 27 Jun 1881 by Work Hughes Jr., Recorder.

NAMES: Felix Boyle Jr. (witness — Captain Felix Boyle, 1839–1916; age ~39 in Sept 1878; in Washington County during whisky distillery partnership period). D.O. Lambert (co-witness — = Daniel O.C. Lambert; FIFTH documented appearance in Boyle legal circle; 1878 fills gap between FB-002 1866 and PR-017 1881). S.F. Jackman (co-witness; also a party as assignee of Azariah Crow). Isaac Ledbetter (co-witness; also party as assignee). Parties to deed: Isaac Ledbetter and S.F. Jackman (assignees of Azariah Crow and wife, grantors); A.F. Conaway (grantee, $90). All parties to deed unrelated to Boyle family.

LOCATIONS: Greenfield, Washington County PA (acknowledgment). Property conveyed (lot of ground with river vein coal excepted): location not specified in visible transcript.

CITED RECORDS: D.O. Lambert co-witness: PR-013 (1857), FB-002 (1866), now 1878 — fills the gap in the Lambert chronology between 1866 and 1881 (PR-017); complete Lambert sequence now 1857, 1866, 1878, 1881, 1883 — 26 years. FB-004 (Apr 1875): Captain Felix joined Zeph M. & John Boyle Jr.''s East Pike Run Township firm including whisky operations — still active in Washington County Sept 1878, consistent with this witness appearance. Distillery failure ca. 1884 and move to Homestead come later. Second deed on same pages (McMichael admin. Lockhart estate → Samuel McMillen, Canonsburg, $1,750, 26 May 1881) has no Boyle connection.

BATCH: SRCH-011'
);

-- WL-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'WL-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'WL'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    94,
    '1878',
    'Legal witness record — Captain Felix Boyle as deed witness; D.O. Lambert as witness and JP, Washington County 1878',
    'Washington County',
    'PA',
    'Deed book, Washington County: Washington. Deed Books 1880–1881; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJS-Q4X6?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-9R2',
    'Companion deed to WL-003 from the same court-ordered assignees'' sale of Azariah Crow''s estate, September 2 1878, Greenfield, Washington County PA. Captain Felix Boyle witnesses again alongside D.O. Lambert. LAMBERT MYSTERY RESOLVED: The acknowledgment clause reads ''D. O. Lambert... J.P.'' — Lambert was a Justice of the Peace, explaining his entire pattern of appearances across 26 years (1857–1883). As JP he held official authority to both witness documents and take acknowledgments, exactly as Ira R. Butler did throughout the Connell Boyle property records. His appearances were not community favors or professional scrivening but his official function. Captain Felix and Lambert together witnessing multiple deeds from the same court-ordered sale on the same day confirms Felix was functioning as a community witness in the Greenfield/East Pike Run Township area during his Washington County distillery period — he and the local JP were the go-to pair for this proceeding. NOTE: WL-003 should be updated to reflect Lambert''s confirmed JP status.

DATES: Deed of assignment: 3 Jan 1878. Assignees'' sale to J.S. Elliott: 6 Jun 1878. Court confirmation of sale: 13 Aug 1878, No. 418 January Term 1878. Acknowledged: 2 Sep 1878, Greenfield, Washington County PA (same date as WL-003). Recorded: 1 Nov 1881 by Work Hughes Jr., Recorder.

NAMES: Felix Boyle Jr. (witness — Captain Felix Boyle, 1839–1916; witnessing second deed from same assignees'' sale as WL-003 on same day). D.O. Lambert (witness AND Justice of the Peace — CONFIRMED JP STATUS; ''D. O. Lambert... J.P.'' at acknowledgment; same dual witness/JP role as Ira R. Butler in Connell Boyle deeds; this resolves the Lambert question: his recurring appearances across 26 years were in his official capacity as JP, not community favors or professional scrivening). Isaac Ledbeter/Leadbeter and S.F. Jackman (assignees of Azariah Crow and wife, grantors). J.S. Elliott (grantee, $76). Work Hughes Jr. (Recorder). Parties to unrelated Arnot deed: Mariana A. Ogden (formerly Arnot); Fannie A. Haren (formerly Palmer); Stephen T. Arnot & Charlotte H. Arnot; John Arnot Jr. & Elizabeth H. Arnot; M.H. Arnot (all devisees/heirs of John Arnot dec., of Elmira, Chemung County NY); William Pate (grantee, Midway PA, $350).

LOCATIONS: Allen Township, Washington County PA (lot conveyed, river vein coal excepted). Greenfield, Washington County PA (acknowledgment). Midway, Washington County PA (second deed, unrelated — Arnot heirs → William Pate, lots 20 & 24 Amos Addition, $350, coal reserved).

CITED RECORDS: Companion deed to WL-003 (same assignees'' sale, same day, same witnesses — WL-003 conveyed to A.F. Conaway for $90; this conveys to J.S. Elliott for $76). Same collection (#008091075) but Item 2 vs Item 1, different images and groupIds. LAMBERT CONFIRMED AS JP: ''D. O. Lambert... J.P.'' at acknowledgment clause — resolves the Lambert mystery; he was a Justice of the Peace, explaining his recurring presence as both witness and acknowledgment-taker across all five Boyle-adjacent appearances. Exact parallel to Ira R. Butler''s dual witness/JP role throughout Connell Boyle deeds (PR-003, PR-006, etc.). Update WL-003 to note Lambert JP status confirmed here.

BATCH: SRCH-011'
);

-- EX-015
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-015',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    95,
    '1867',
    'EXCLUDED — third appearance of FB-005 / EX-008 (same ARK ID, different keyword string in URL)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1867–1868; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNT-8742?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9Z7-K16',
    'EXCLUDED: Same document as FB-005 (first logged) and EX-008 (first duplicate). FamilySearch has now returned this record three times in SRCH-011 under the same ARK ID but with different keyword strings in the URL. No new content. ''Zeph M. Boyle'' rendered as ''[Joseph?] M. Boyle'' by AI summary for the third consecutive time — the ''Zeph'' → ''Joseph'' OCR confusion is consistent and predictable.

DATES: Same as FB-005. Deed: 13 Apr 1867. Recorded: 18 Apr 1867.

NAMES: Same as FB-005. Felix Boyle Jr. (grantor); Zeph M. Boyle and John Boyle (grantees). AI renders Zephaniah as ''Joseph M. Boyle'' for third time.

LOCATIONS: Same as FB-005. Carroll Township, Washington County PA.

CITED RECORDS: Third appearance of same document as FB-005 and EX-008 (Felix Boyle Jr. → Zeph M. & John Boyle, one-fourth Carroll Township O''Hara parcel, $1,250, 13 Apr 1867). Same ARK ID (3Q9M-CSNT-8742) and groupId (M9Z7-K16) as EX-008; different keyword string in URL. AI summary again renders ''Zeph M. Boyle'' as ''[Joseph?] M. Boyle'' — same OCR misread pattern noted in FB-005.

BATCH: SRCH-011'
);

-- EX-016
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-016',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    96,
    '1881',
    'EXCLUDED — duplicate of PR-017 (same ARK ID, different search parameters)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1881–1882; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ9-YDBC?view=fullText&keywords=Felix+Boyle%2CBoyle&searchForm=simple&lang=en&groupId=M9Z4-1SK',
    'EXCLUDED: Same document as PR-017. Appeared in SRCH-011 (Felix Boyle search) because Felix Boyle Jr. is a grantor; previously retrieved in SRCH-002 (Connell Boyle search) and logged as PR-017. New Zephaniah OCR variants: ''Rephania M Boyle'' and ''Jepenia M Boyle'' join the existing set (Tephench, Zeph, Joseph, Beph, Seph). No new substantive content.

DATES: Same as PR-017. Deed: 15 Jun 188[1]. Acknowledged: 25–26 Jul 1881.

NAMES: Same as PR-017. New OCR variants for Zephaniah M. Boyle: ''Rephania M Boyle'' (signing line) and ''Jepenia M Boyle'' (acknowledgment clause) — adds to the existing variants (''Tephench,'' ''Zeph,'' ''Joseph'') for future OCR reference.

LOCATIONS: Same as PR-017. Carroll Township, Washington County PA.

CITED RECORDS: Same document as PR-017 (Connell Boyle''s heirs → Myers heirs, 2-acre Carroll Township river parcel, $50, 1881). Same ARK ID (3Q9M-CSJ9-YDBC) and groupId (M9Z4-1SK); different URL parameters because PR-017 was retrieved via SRCH-002 (Connell Boyle search) and this via SRCH-011 (Felix Boyle search).

BATCH: SRCH-011'
);

-- FB-006
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'FB-006',
    (SELECT id FROM seanchai.record_type   WHERE code = 'FB'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    97,
    '1875',
    'Deed (warranty, Felix Boyle Sr. & Elizabeth → Robert Smith Wilson, ~50 acres Fallowfield Township, $4,400)',
    'Washington County',
    'PA',
    'Deed book: Washington. Deed Books 1876–1877; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSX1-69JH-B?view=fullText&keywords=Boyle%2CFelix+Boyle&searchForm=simple&lang=en&groupId=M9ZQ-8MJ',
    'Felix Boyle Sr. (1813–1884) and wife Elizabeth sell approximately 50 acres in Fallowfield Township to Robert Smith Wilson for $4,400, April 1, 1875 — the same month Captain Felix buys into his brothers'' East Pike Run Township firm (FB-004). ELIZABETH ''KELLER'' IS AN OCR ERROR: Carolyn confirmed by reading the original document image that the warranty clause says ''Elizabeth Boyle'' not ''Elizabeth Keller'' — ''Keller'' is an OCR misread of ''Boyle'' in period cursive. No maiden name discrepancy; Elizabeth V. Henderson (BIO-001) confirmed. JOHN BOYLE SHERIFF''S SALE DATED: ''sold by W McRe Esq Sheriff of Washington County as the property of John Boyle to Felix Boyle... No. 41 February 7 1859'' — first confirmed date and case number for John Boyle Sr.''s sheriff''s sale that put the John Boyle tract into Felix Sr.''s hands. ''W McRe'' = OCR garble of sheriff''s name (possibly McGiffin, referenced in FB-001). FITZSIMMONS COAL CONFIRMED: Six-foot river vein already conveyed to J. Fitzsimmons and Son (1853 Romania Farm transactions, PR-014/PR-032); Felix explicitly reserves a 3-acre coal privilege for his adjoining farm. BOUNDARY NEIGHBORS: Thomas Fry and Dalton Shannon — same men from the 1853 Romania Farm cluster, still on adjacent land 22 years later, confirming geographic continuity. OCR: ''Felip Boyle'' = Felix Boyle; ''He and Boule his Will'' = ''He [Felix Boyle] and [Elizabeth] Boule his Wife''; ''W McRe Esq'' = OCR garble of sheriff''s name.

DATES: Deed: 1 Apr 1875. Acknowledged: 6 Apr 1875 before J.N.B. Holland JP. Recorded: 1 May 1877 by James A. Galbraith, Recorder.

NAMES: Felix Boyle (grantor — Felix Boyle Sr., 1813–1884, still of Carroll Township in April 1875; OCR: ''Felip Boyle,'' ''He and Boule''); Elizabeth Boyle his wife (grantor — OCR: ''Elizabeth Boyle'' in granting clause, ''Elizabeth Keller his Wife'' in warranty clause — DISCREPANCY with BIO-001''s ''Elizabeth V. Henderson''; see summary); Robert Smith Wilson (grantee, Fallowfield Township). Prior party: John Boyle (prior owner whose land was sold at sheriff''s sale, Case No. 41, 7 Feb 1859, by ''W McRe Esq'' = OCR garble of sheriff''s name, to Felix Boyle). Coal reservation: J. Fitzsimmons and Son (holders of six-foot river vein coal per 1853 conveyances). Felix retains 3 acres of river vein coal for his adjoining farm. Witnesses: John S. Williams; J.N.B. Holland (also JP). Recorder: James A. Galbraith.

LOCATIONS: Fallowfield Township, Washington County PA (~50 acres conveyed; coal reserved). Felix and Elizabeth''s stated residence: Carroll Township, Washington County PA. Robert Smith Wilson''s residence: Fallowfield Township.

CITED RECORDS: FB-001 (Feb 1884, same ''John Boyle tract'' sold to Phebe Wilson — Felix acquires via sheriff''s sale, sells surface 1875, then transfers remainder 1884 with coal reservation). Sheriff''s sale Case No. 41, 7 Feb 1859: first documented date and case number for the John Boyle tract acquisition. Fitzsimmons coal reservation: coal already conveyed to J. Fitzsimmons and Son 1853 (PR-014, PR-032) — Felix explicitly acknowledges this prior conveyance. BIO-001 (Beers 1893): Elizabeth V. Henderson Boyle — DISCREPANCY with ''Elizabeth Keller'' here; see summary. Thomas Fry and Dalton Shannon as boundary neighbors: same men from the 1853 Romania Farm deeds (PR-018, PR-032), still on adjacent land 22 years later. J.N.B. Holland as JP: same Holland family as J. Holland (PR-043, 1875; PR-057, 1883).

BATCH: SRCH-011'
);

-- NR-004
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'NR-004',
    (SELECT id FROM seanchai.record_type   WHERE code = 'NR'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    98,
    '1870',
    'Naturalization petition — Patrick O''Neill, with Felix Boyle as witness; Washington County PA, ca. 1872+',
    'Washington County',
    'PA',
    'Naturalization records and index: Washington. Declarations of Intention 1866–1884, Naturalization Records 1866–1884, Petitions for Naturalization 1866–1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSMY-PQ1L-5?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'FOUNDATIONAL SOURCE. Patrick O''Neill — father of Maria Anna O''Neill, future wife of Captain Felix Boyle — petitions for US citizenship in Washington County, with Felix Boyle as witness. KEY FINDINGS: (1) FELIX BOYLE AS WITNESS FOR FUTURE FATHER-IN-LAW: Captain Felix vouches for Patrick O''Neill''s residence and good moral character before the marriage to Maria Anna O''Neill (Maria Anna born 1859; marriage almost certainly later 1870s or 1880s). The relationship between the two families predates the marriage and is documented here in primary source. (2) PATRICK SIGNED BY MARK: ''Patrick his Neil Mark'' — the grading contractor who built Homestead''s infrastructure could not write his own name. This is the record Carolyn noticed in the pre-ledger Gemini sessions because of the mark. Confirmed by image. (3) TWELVE YEARS US RESIDENCE: Patrick arrived ca. 1858–1862 — post-Famine, not Famine-era. Only one year in Pennsylvania at time of petition, suggesting prior US residence elsewhere (Ohio? New York?) before coming to Washington County. (4) DECLARATION FILED IN FEDERAL COURT: Patrick filed his first papers in the Western District of Pennsylvania federal court (Pittsburgh), not a county court — different from most Washington County petitioners. (5) CONFIRMS FELIX/PATRICK RELATIONSHIP: Captain Felix''s presence as witness in a Washington County naturalization record ca. 1872 is consistent with his documented Washington County activities (WL-003, WL-004: Greenfield 1878; FB-004: East Pike Run Township distillery partnership 1875). He was embedded in Washington County community life throughout this period. (6) UNCLE FELIX CONNECTION: Felix Sr. (1813–1884) may also have had a relationship with Patrick O''Neill — the grading contractor working the Mon valley in the 1850s–60s would have been in the Boyle orbit. Captain Felix as witness may have been introduced through his uncle. OCR: ''Patrick Oil'' = Patrick O''Neill (first line of petition); ''John Hain'' = John Cain (confirmed by signature line).

DATES: Declaration of intention: 28 Jun 1870, Clerk''s Office of the Western District of Pennsylvania (federal court). Petition to Washington County Court of Common Pleas: date not stated in transcript; filed more than two years after declaration, so ca. mid-1872 or later.

NAMES: Patrick O''Neill / Oneill (petitioner — native of Ireland; signed by mark: ''Patrick his ✛ O''Neil / Mark'' — a cross symbol, confirmed by image; father of Maria Anna O''Neill who married Captain Felix Boyle; pioneer grading contractor of Homestead per Captain Felix''s 1916 obituary). Felix Boyle (witness — almost certainly Captain Felix Boyle 1839–1916, Connell''s son; signed ''Felix Boyle'' in confident flowing cursive immediately below Patrick''s cross, confirmed by image; age ~33 in 1872). John Hain / Hain (co-witness — image reads ''John Hain''; signed alongside Felix Boyle). A.W. Ackeson (President Judge, Washington County Court of Common Pleas).

LOCATIONS: Washington County PA (petition). Western District of Pennsylvania, federal court (declaration of intention, June 1870).

CITED RECORDS: WL-003, WL-004: Captain Felix in Washington County 1878, consistent with earlier Washington County witness activity here. FB-004: Captain Felix''s East Pike Run Township distillery partnership from Apr 1875 — same Washington County period. Captain Felix''s 1916 obituary (Daily Republican, Aug 19 1916): ''survived by widow Mrs. Mary Boyle (daughter of the late Patrick O''Neill, pioneer grading contractor of Homestead)'' — confirms this Patrick O''Neill is Maria Anna''s father. C&J Boyle shipyard stories card: Patrick O''Neill may have been in the Boyle orbit through Felix Sr. before Captain Felix vouched for him here.

BATCH: SRCH-011'
);

-- EX-018
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'EX-018',
    (SELECT id FROM seanchai.record_type   WHERE code = 'EX'),
    (SELECT id FROM seanchai.record_status WHERE name = 'excluded'),
    99,
    '1899',
    'EXCLUDED — unrelated Felix Boyle, Luzerne County PA (adjacent landowner reference only)',
    'Luzerne County',
    'PA',
    'Luzerne. Deeds 1899–1900; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ4-N9YJ-G?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en',
    'EXCLUDED: Felix Boyle appears only as an adjacent landowner in the metes and bounds description of a Wilkes-Barre property deed. Not a party to any transaction. REASONS FOR EXCLUSION: (1) WRONG GEOGRAPHY: Luzerne County is northeastern Pennsylvania (anthracite coal region, Wilkes-Barre). The family''s entire documented presence is in western PA — Washington, Allegheny, and Fayette Counties. No family member is known to have owned property in Luzerne County. (2) WRONG DATE: 1899. Felix Sr. died 1884; Captain Felix was in Homestead by 1886 and never documented in northeastern PA. (3) ADJACENT LANDOWNER ONLY: Felix Boyle appears solely as a boundary reference (''land of Felix Boyle''), not as a grantor, grantee, or witness. Appeared in SRCH-011 because FamilySearch full-text search indexes metes and bounds descriptions.

DATES: Deed: 8 Nov 1899. Recorded: 20 Dec 1899. Sheriff''s deed in title chain: 28 Oct 1878.

NAMES: Felix Boyle (adjacent landowner only — appears in metes and bounds description as boundary reference; NOT a party to the deed). Anne P. Worden (executrix of Annie L. Paine, grantor). Charles McCue and Bridget McCue (grantees, $1,000). P.J. Kenny (prior sheriff, title chain). Geo. T. Kirkendall (Notary Public).

LOCATIONS: City of Wilkes-Barre, Luzerne County PA. Baltimore Lane.

CITED RECORDS: No connection to any Boyle family records. Wrong geography — Luzerne County is northeastern PA anthracite region, entirely separate from the Mon valley western PA territory.

BATCH: SRCH-011'
);

-- WL-005
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'WL-005',
    (SELECT id FROM seanchai.record_type   WHERE code = 'WL'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    100,
    '1868',
    'Will witness — Felix Boyle witnesses Rebecca Wilson will, Fallowfield Township, Washington County PA',
    'Washington County',
    'PA',
    'Washington. Wills 1865–1872; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QSQ-G991-MWC9?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M98R-MQN',
    'Felix Boyle witnesses the will of Rebecca Wilson (widow) of Fallowfield Township, February 15, 1868. Fallowfield Township is directly adjacent to Carroll Township (Boyle farm). Almost certainly Felix Sr. (age 55 in 1868, retired from river work, back on the Carroll Township farm) continuing the family pattern as community legal anchor for neighbors. Rebecca signed by mark. Co-witnesses Dutton Shannon and B. Crow Jr. Wilson family connected to Boyle family through adjacent property and the 1875 sale to Robert Smith Wilson (FB-006). WPA typed transcript — unusually clean text.

DATES: Will executed: 15 Feb 1868, Fallowfield Township. Will proved: 27 Feb 1868, Washington County.

NAMES: Rebecca Wilson (widow, testatrix — signed by mark ''Rebecca x her mark Wilson''; Fallowfield Township). Felix Boyle (subscribing witness — UNCERTAIN: almost certainly Felix Sr. 1813–1884, age 55 in 1868, retired to Carroll Township farm adjacent to Fallowfield; Captain Felix 1839–1916 age 29 also possible but less consistent with witness pattern). Dutton Shannon (co-witness). B. Crow Jr. (co-witness — likely connected to Azariah Crow family, WL-003/WL-004). A.J. McCarty (executor, son-in-law). Geo. Buchanan (Register for Probate). Twelve named children: Isabell Furgison, John Wilson, Roseanne Manch, Sharlotte Melvain, Rebecca Rider, Matilda McCarty, Eliza Colven, Susana Wilson (wife of Smith Wilson), Lydia Wilson, Malinda Wilson, Mary Anne Wilson, Phebe Wilson.

LOCATIONS: Fallowfield Township, Washington County PA. Adjacent to Carroll Township (Boyle farm).

CITED RECORDS: WL-001, WL-002: prior Boyle will witness appearances establishing Felix as Carroll/Fallowfield Township community legal anchor. FB-006: Felix Sr. and Elizabeth sold property to Robert Smith Wilson 1875 — possible connection to Rebecca Wilson''s family. WL-003, WL-004: B. Crow Jr. as co-witness here likely connected to Azariah Crow assigned estate records.

NOTES: WPA TYPED TRANSCRIPT — Works Progress Administration typed version; unusually clean and reliable text compared to handwritten originals or OCR. Will structure: $1 each to eight older children (protective bequests to forestall challenges) with bulk of estate to four youngest daughters (Lydia, Malinda, Mary Anne, Phebe) who receive all household property and residue equally. Rebecca signed by mark. WILSON FAMILY CONNECTION: Phebe Wilson is named as residual beneficiary here (1868); Robert Smith Wilson purchased property from Felix Sr. and Elizabeth in 1875 (FB-006, $4,400). Susana Wilson married Smith Wilson — Robert Smith Wilson may be their son, connecting the 1868 will to the 1875 deed. B. CROW JR.: same family as Azariah Crow (WL-003, WL-004 — Felix witness to Crow assigned estate deeds 1878). Community witness network consistent across Carroll/Fallowfield Township records.

BATCH: SRCH-011'
);

-- PT-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'PT-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'PT'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    101,
    '1884',
    'Will (Zephaniah M. Boyle, Coal Centre, Washington County PA)',
    'Washington County',
    'PA',
    'Will Book: Washington. Will Books 1883–1884; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-L9SM-CSTT?view=fullText&keywords=Rebecca%2CBoyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en&groupId=M9HF-Q3N',
    'NEW RECORD — NOT PREVIOUSLY IN LEDGER. Zephaniah M. Boyle''s will, executed February 7, 1884 — eight days before the February 15, 1884 sheriff''s sale of the Z.&J. Boyle Distillery for back taxes and the same date as Zephaniah''s death (per Washington County Historical Society Facebook post). KEY FINDINGS: (1) ZEPHANIAH DIED FEBRUARY 15, 1884: Will executed Feb 7, probated March 3 — consistent with death on or around Feb 15, 1884, the same day the sheriff sold the distillery. (2) SIGNED BY MARK: Zephaniah signed his will with a mark rather than his name — possibly illiterate, or too ill/distressed to sign. (3) WATCH AND CHAIN TO CAPTAIN FELIX: Only individual bequest; the brothers'' relationship acknowledged even if Captain Felix had left the firm before the collapse. (4) EVERYTHING ELSE TO REBECCA: Mother as sole heir — no wife, no children named. Zephaniah died intestate as to descendants, leaving only his mother as beneficiary, consistent with dying unmarried or childless. (5) REBECCA OUTLIVED HIM BY 15 YEARS: She was approximately 64 in February 1884 and died April 1899. She served as executor for over a year after Bane renounced. (6) CAUSE OF DEATH UNKNOWN — POSSIBLE SUICIDE: Distillery sold by sheriff for back taxes on the same day as death. The timing raises the possibility of suicide. Catholic burial in consecrated ground would have been denied for a confirmed suicide; Rebecca''s close relationship with Bishop Tuigg (PR-057, Jan 1883 church land deed) and the Catholic institutional network would have created strong pressure to record cause of death differently if it was suicide. Pennsylvania death certificates were not systematically recorded until 1906 — pre-1906 cause of death for Zephaniah may simply not exist in official records. RESEARCH NOTE: Search Washington County coroner records 1884 and Coal Centre/Monongahela City newspaper death notices for February 15–March 1884 to find any cause of death. OCR: ''Zephaniah M. Bagle'' = Zephaniah M. Boyle (testator name in heading); ''J. C. Bove affirmed'' = J.C. Bane affirmed (witness acknowledgment).

DATES: Will executed: 7 Feb 1884, Coal Centre, Washington County PA. Probated: 3 Mar 1884. J.C. Bane renounced as executor: Dec 9, 1885. Rebecca A. Boyle qualified as sole executor: Dec 9, 1885.

NAMES: Zephaniah M. Boyle (testator — Connell''s son, distillery partner, signed by mark ''Zephaniah M Boyle ℗''; Coal Centre, Washington County PA). Rebecca A. Boyle (mother and principal beneficiary; also named co-executor; qualified as sole executor after Bane''s renunciation; still alive Feb 1884 — died April 1899, outliving Zephaniah by 15 years). Felix Boyle (brother, bequeathed watch and chain — almost certainly Captain Felix 1839–1916, Connell''s son; the only sibling named individually). J.C. Bane / James Calvin Bane (named co-executor and subscribing witness; Fredericktown, Washington County PA; later renounced executor role Dec 1885). Lawrence J. Elwood (subscribing witness; Fredericktown, Washington County PA). John F. Cooper (Register for Probate, Washington County — admitted will March 3, 1884).

LOCATIONS: Coal Centre, Washington County PA (testator''s residence). Fredericktown, Washington County PA (witnesses). Washington County PA (probate).

CITED RECORDS: FB-004 (Apr 1875): Zephaniah in firm with John Boyle Jr. and Captain Felix, whisky operation. PR-057 (Jan 1883): Zephaniah signs Carroll Township church land deed to Bishop Tuigg — still active 10 months before death. Washington County Historical Society Facebook post (Sept 5, 2025): Z.&J. Distillery sold by high sheriff Feb 15, 1884 — same date as Zephaniah''s death per that source. PT-001: Prior probate record (Connell Boyle estate, 1861). People/zephaniah-boyle.md: main memory file.

BATCH: SRCH-012'
);

-- ROM-001
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'ROM-001',
    (SELECT id FROM seanchai.record_type   WHERE code = 'ROM'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    102,
    '1801',
    'Deed (warranty, James Rice & Sophia → Robert Williams, 92.5 ac Romania, Carroll Twp, Washington County PA)',
    'Washington County',
    'PA',
    'Washington. Deeds 1807–1810; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS4T-6BVK?view=fullText&keywords=United+States%2CPennsylvania%2CWashington%2CRomania&searchForm=advanced&lang=en',
    'FOUNDATIONAL RECORD. James Rice and Sophia Rice sell 92.5 acres (part of Romania) to Robert Williams for $43.20, January 19, 1801 — the same day as the Crawford sale (ROM-002), confirming coordinated distribution of the Romania tract. Romania patent issued November 13, 1800, just 2 months before this sale; James Rice moved quickly to distribute the land. KEY FINDINGS: (1) ABRAHAM FRY BORDERS ROMANIA ON MULTIPLE SIDES: The patent description names Abraham Fry as an adjacent landholder. The metes and bounds references ''Abraham Frye Snap''s land'' and ''Abraham Fryes land'' as boundary lines of the Williams parcel — Fry''s land borders Romania on at least two sides. (2) WOLF HARBOUR FRONTAGE: The Williams parcel runs along the Monongahela to Wolf Harbour — this is the river-front portion of Romania. (3) WILLIAM CRAWFORD ALREADY A NEIGHBOR: Metes and bounds reference ''said James Rices land'' and ''William Crawfords land'' — Crawford already holds adjacent land before receiving the simultaneous 54-acre sale (ROM-002). (4) COORDINATED SAME-DAY SALES: Williams and Crawford deeds both dated January 19, 1801, Crawford''s parcel bounded by the Williams parcel just created — pre-arranged distribution, not independent transactions. (5) 1800 PATENT, 1807–1810 DEED BOOK: Deed was recorded 1810, nine years after execution; not unusual for Washington County period. OCR: ''James Price'' = James Rice (grantor name in indenture preamble — period handwriting ''R'' misread as ''P''); ''Abraham Frye Snap''s land'' = Abraham Frye''s land (with ''Snap'' likely OCR of a directional abbreviation). Spatial accounting: Williams (92.5 ac) + Crawford (54 ac, ROM-002) + Ann Rice Boyle (~123 ac, PR-054) = ~269.5 ac against 263 ac + 6% allowance = ~278 ac total; roughly consistent with the allowance and boundary imprecision.

DATES: Deed: 19 Jan 1801. Sophia acknowledged: 30 Jan 1801 before Daniel Depue JP. Recorded: 21 Mar 1810 by Isaac Kerr, Recorder.

NAMES: James Rice (grantor; Carroll Township, Washington County PA; 1796 Romania warrant holder; patent Nov 13, 1800 under Gov. Thomas McKean). Sophia Rice his wife (grantor; separately acknowledged). Robert Williams (grantee; same county and commonwealth). Abraham Fry / Frye (boundary neighbor — listed in patent description as adjacent landholder; appears twice in metes and bounds: ''Abraham Frye Snap''s land'' and ''Abraham Fryes land''). Shap Alexander (boundary neighbor). George Dugal Boyd (boundary neighbor). John Gutrie, John Depue, Nic Depue (witnesses to deed). Daniel Depue (JP for acknowledgment). Thomas McKean (Governor, issued Romania patent Nov 13 1800). Isaac Kerr (Recorder).

LOCATIONS: Carroll Township, Washington County PA (Romania tract, Monongahela River). Wolf Harbour (named geographic feature, Monongahela frontage).

CITED RECORDS: PR-054: Rice→Felix Philemon Boyle deed conveying ~123 acres of Romania to Ann and Phelim (''natural love and affection'' — parental gift at marriage, not a sale). ROM-002: Rice→Crawford deed, 54 acres, same day. people/john-shanton.md: Levisey Shanton née Fry — Fry family held adjacent land; Abraham Fry documented as Romania''s direct neighbor here confirms the Fry-Boyle-Shanton land connection. topics/rice-newkirk-ancestry.md: Romania naming as Catholic cultural declaration; James Rice background.

BATCH: SRCH-012'
);

-- ROM-002
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'ROM-002',
    (SELECT id FROM seanchai.record_type   WHERE code = 'ROM'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    103,
    '1796',
    'Deed (warranty, James Rice & Sophia → William Crawford, 54 ac Romania, Carroll Twp, Washington County PA)',
    'Washington County',
    'PA',
    'Washington. Deeds 1798–1802; via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-89DX-7ZNL?view=fullText&keywords=WASHINGTON%2CWashington%2CPENNSYLVANIA%2CRomania&searchForm=advanced&lang=en&groupId=M9R7-1P1',
    'James Rice and Sophia Rice sell 54 acres of Romania to William Crawford for $25.74, January 19, 1801 — same day as the Williams sale (ROM-001). CONFIRMING ''ABRAHAM TRYESLAND'' = ''ABRAHAM FRYE''S LAND'': The metes and bounds reads ''thence by Abraham Tryesland south sixty degrees east sixty two perches.'' Cross-referencing with ROM-001 (same deed book, same landscape, same scrivener''s handwriting) where the same boundary appears as ''Abraham Frye Snap''s land'' and ''Abraham Fryes land'' — ''Tryesland'' is unambiguously an OCR misread of ''Frye''s land'' in period cursive (the ''Fr'' ligature read as ''Tr'', ''yes'' and ''land'' run together). Abraham Fry thus borders the Crawford parcel on the east. CRAWFORD ALREADY A NEIGHBOR: Crawford''s parcel begins ''thence by the said William Crawfords land'' — he already owned adjacent land. The Crawford parcel is also bounded by the Williams parcel (ROM-001, created the same day): ''thence by land of Robert Williams north fifty eight degrees west one hundred and fourteen perches.'' This confirms the three sales (Williams, Crawford, Ann Rice Boyle) were coordinated to divide Romania among known neighbors and family. PRICE: $25.74 for 54 acres — low even for frontier land, suggesting a near-gift price for a neighbor Crawford already well-known to Rice. OCR: ''Abraham Tryesland'' = Abraham Frye''s land (confirmed by ROM-001 cross-reference).

DATES: Warrant: 12 Apr 1796. Patent: 13 Nov 1800. Deed: 19 Jan 1801. Recorded: (in deed book 1798–1802).

NAMES: James Rice (grantor; Carroll Township, Washington County PA). Sophia Rice his wife (grantor). William Crawford (grantee; same county and state; ALREADY HELD ADJACENT LAND — ''beginning at a beech thence by the said William Crawfords land''). Abraham Frye (boundary neighbor — appears as ''Abraham Tryesland'' in OCR, i.e. ''Abraham Frye''s land'').

LOCATIONS: Carroll Township, Washington County PA (54-acre portion of Romania, Monongahela River watershed).

CITED RECORDS: ROM-001: Rice→Williams deed, 92.5 acres, same day — Williams parcel appears as boundary here. PR-054: Rice→Boyle deed, ~123 acres, parental gift to Ann Rice and Felix Philemon. people/john-shanton.md: Fry family land adjacency to Romania and Boyle farm. topics/rice-newkirk-ancestry.md: Romania tract background.

BATCH: SRCH-012'
);

-- ROM-003
INSERT INTO seanchai.records
    (record_id, record_type_id, record_status_id, display_order,
     year, subject, county, state, source_citation, source_url, notes)
VALUES (
    'ROM-003',
    (SELECT id FROM seanchai.record_type   WHERE code = 'ROM'),
    (SELECT id FROM seanchai.record_status WHERE name = 'active'),
    104,
    '1769',
    'County history excerpt — Carroll Township early settlement; Frye family warrants 1769–1785; Romania adjacency to Abraham Frye (Crumrine 1882, pp. 690–691)',
    'Washington County',
    'PA',
    'Pennsylvania. Military Records 1882 | Washington. Biographies 1882 | Warren. History Records 1887 — Item 2 (Crumrine, History of Washington County PA, 1882); via FamilySearch',
    'https://www.familysearch.org/ark:/61903/3:1:3QS7-89DX-7ZNL?view=fullText&keywords=WASHINGTON%2CWashington%2CPENNSYLVANIA%2CRomania&searchForm=advanced&lang=en&groupId=M9R7-1P1',
    'CRITICAL SECONDARY SOURCE. Boyd Crumrine''s 1882 History of Washington County PA establishes that the Frye family were among Carroll Township''s FIRST settlers — documented as early as April 1769, nearly three decades before James Rice received the Romania warrant in 1796. KEY FINDINGS: (1) FRYE FAMILY SEQUENCE: William Frye holds Cherry Garden (178 ac, 1769); Cherry Garden reverts to Abraham Frye in 1785. Samuel Frye receives Christian''s Queen (293 ac, adjoining Abraham Frye''s land) and Samuel''s Farm (236 ac) in 1784–1785. This is a three-generation or sibling sequence — William → Abraham → Samuel — all in Carroll Township before Rice arrives. (2) CRUMRINE DIRECTLY LINKS ROMANIA TO ABRAHAM FRY: ''James Rice received a warrant for a tract of two hundred and sixty-three acres of land, entitled Romania, April 12, 1796... It adjoined lands of Abraham Frye and the Monongahela River.'' — the county historian in 1882 independently confirms what the deed language shows. (3) 1834 TOWNSHIP FORMATION EXPLAINS FALLOWFIELD FRY DEED: Crumrine states Carroll Township ''until its organization in 1834 formed part of Fallowfield and Nottingham townships.'' The 1848 Fry heirs deed (100-ac tract on Son Creek, Fallowfield Township) reflects land in the portion that stayed in Fallowfield after the 1834 carve-out. The Frye family held land on both sides of what became the Fallowfield/Carroll boundary. (4) LEVISEY SHANTON''S GRANDFATHER: If William Frye (Cherry Garden, 1769) → Abraham Frye (inherited Cherry Garden, 1785) → Samuel Frye (Christian''s Queen + Samuel''s Farm, 1784–85) is a father-son-grandson sequence, then Samuel Frye is Levisey''s father (her siblings in the 1848 deed: Samuel, Elisabeth, Sarah, Ursula) and Abraham Frye is her grandfather. She married into land her grandfather had held since before the Revolution. (5) DEPUE FAMILY AS EARLIEST SETTLERS: Crumrine names ''Depues, Fromans, Fryes, Irwins...'' as the very first Carroll Township settlers. The Depues (John Depue, Nic Depue) witness the Rice→Williams Romania deed (ROM-001) — the founding settler families are still present and active as witnesses in 1801. NOTE: Crumrine is an 1882 secondary source drawing on county records and oral history; the warrant dates and acreages he gives are independently confirmed by the deed documents (ROM-001, ROM-002). (6) CRUMRINE''S EDITORIAL PLACEMENT — CRITICAL FOR MEMOIR: Crumrine places the Romania sentence immediately before ''As the early settlers were chiefly Scotch-Irish Presbyterians...'' The transition is deliberate: he is contextualizing Romania within the religious landscape. The Presbyterian log church (sixteen corners) was built ca. 1785 ''on lands now known as the Wilson farm'' near the Carroll/Fallowfield line — within sight of where Romania would be surveyed in 1797. Rev. John McMillan likely preached the dedicatory sermon; the McMillan family later sold land to the Boyles (Robert McMillan → John and Connell Boyle, 1838, PR-014). Rev. Samuel Ralston arrived November 1796 — seven months after Rice''s April 1796 Romania warrant. The Catholic land claim and the new Presbyterian minister''s arrival are essentially simultaneous. Rice planted Romania not against an abstract oppressor but in a landscape that was actively Presbyterian, with a standing church nearby. This is the landscape context for Carolyn''s read of Romania as a declaration: ''I answer to Rome; my family has answered to Rome since before your people had two pennies to rub together.''

DATES: Events described: 1769–1797. History published: 1882.

NAMES: William Frye (Cherry Garden warrant No. 3091, Apr 17 1769, 178 acres, west side Monongahela, adjoining Jacob Froman on river — warrant returned to Abraham Frye Aug 26 1785). Abraham Frye (received Cherry Garden warrant returned by William Frye, Aug 26 1785; his land borders Romania per patent description and Crumrine text). Benjamin Frye (Fair View, 337 acres — warrant issued to Nathan Hammon Aug 26 1769, interest transferred to Benjamin Frye; ultimately surveyed for Jeremiah Proctor after dispute). Samuel Frye (Christian''s Queen, 293 acres on waters of Maple Creek, adjoining Abraham Frye — warrant Dec 30 1784, surveyed Nov 23 1785; also received Samuel''s Farm, 236 acres, from Frederick Cooper, surveyed Nov 22 1785). James Rice (Romania, 263 acres, warrant Apr 12 1796, surveyed Oct 20 1797 — Crumrine: ''It adjoined lands of Abraham Frye and the Monongahela River''). Nicholas Crist, Jacob Froman, Paul Froman, Nathan Hammon, Frederick Cooper, Jeremiah Proctor, Elisha Teeters, Sheshbazzar Bentley (other early Carroll Township settlers named in Crumrine).

LOCATIONS: Carroll Township, Washington County PA (formed 1834 from Fallowfield and Nottingham townships). Monongahela River (west bank). Maple Creek (tributary).

CITED RECORDS: ROM-001: Rice→Williams deed confirming ''Abraham Frye Snap''s land'' and ''Abraham Fryes land'' as Romania boundaries. ROM-002: Rice→Crawford deed confirming ''Abraham Tryesland'' (= Abraham Frye''s land) as boundary. people/john-shanton.md: Levisey Shanton née Fry; 1848 Fry heirs deed; Fry family in Fallowfield Township. topics/rice-newkirk-ancestry.md: Romania tract, James Rice background.

BATCH: SRCH-012'
);


-- --------------------------------------------------------------------------
-- Searches (12)
-- --------------------------------------------------------------------------

-- SRCH-001
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-001',
    'Connell Boyle',
    'United States of America → Pennsylvania → Fayette County',
    'From 1800 AD',
    12,
    'complete',
    'Full-text advanced search. URL params: nlQuery=Connell%20Boyle, count=100, f.recordYear0=1800, c.recordYear1=on, Place filter USA→PA→Fayette applied via sidebar facet. All 12 results were Washington County collections (deeds, mortgages, deed indexes) plus one Allegheny County court docket — no Fayette County records despite the county filter. Records logged as PR-001 through PR-011 and GV-001.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSNL-WZNR?view=fullText&keywords=Connell+Boyle%2CUnited+States%2CPennsylvania%2CFayette&searchForm=advanced&lang=en',
    '2026-09-29 00:00:00+00'
);

-- SRCH-002
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-002',
    'Connell Boyle',
    'United States of America → Pennsylvania → Washington County',
    'From 1800 AD',
    55,
    'complete',
    'Same parameters as SRCH-001 with Place filter changed from Fayette to Washington County. 55 results on first run; some were duplicates, exclusions, or index-only entries. COMPLETE: 50 records logged (PR-012 through PR-050, plus MG-001/MG-002, WL-001/WL-002, NR-001, PT-001, EX-001/EX-002, PR-044 probate). Records span 1833\u20131884. Next batch: Felix Boyle search (SRCH-003 planned).',
    '2026-09-30 00:00:00+00'
);

-- SRCH-003
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-003',
    'Connell Boyle',
    'United States of America → Pennsylvania → Allegheny County',
    'From 1800 AD',
    18,
    'complete',
    'Same parameters as SRCH-001/002 with Place filter changed to Allegheny County. 18 results. Only PR-051 logged from this batch — a Moorhead declaration of trust (Washington. Deeds 1857–1858) that appeared in Allegheny County search because acknowledgment was taken in Pittsburgh before Alderman Buckmaster. Remaining results not yet logged. Next: Philemon Boyle in Washington County (SRCH-004).',
    '2026-09-30 00:00:00+00'
);

-- SRCH-004
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-004',
    'Philemon Boyle',
    'United States of America → Pennsylvania → Washington County',
    'No lower bound — upper bound 1900',
    1,
    'complete',
    'Searching for the patriarch (Phelim/Philemon/Felix P. Boyle, 1768–1841, immigrant from Killygordon, Donegal). ''Philemon'' is the anglicized form used in the October 1852 Washington County deed partition. Quoted search with year upper bound 1900, no lower bound. Only 1 result returned. Unquoted search returns 6k+ results (noise). Next variants: Phelim Boyle, Felix Boyle Washington County (Felix Sr. 1813–1884). Also searching Fayette and Allegheny County for Philemon before moving to Felix.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-S7WW?view=fullText&keywords=Philemon+Boyle%2CPennsylvania%2CWashington&searchForm=advanced&lang=en',
    '2026-10-01 00:00:00+00'
);

-- SRCH-005
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-005',
    '"Philemon Boyle"',
    'United States of America → Pennsylvania → Fayette County',
    'No lower bound — upper bound 1900',
    0,
    'complete',
    'Philemon Boyle, quoted, in Fayette County PA. 0 results. No Fayette County records for the patriarch under this name variant.',
    '2026-10-01 00:00:00+00'
);

-- SRCH-006
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-006',
    '"Philemon Boyle"',
    'United States of America → Pennsylvania → Allegheny County',
    'No lower bound — upper bound 1900',
    0,
    'complete',
    'Philemon Boyle, quoted, in Allegheny County PA. 0 results. No Allegheny County records for the patriarch under this name variant.',
    '2026-10-01 00:00:00+00'
);

-- SRCH-007
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-007',
    'Keywords: Boyle / Name: "James Rice"',
    'Washington, Pennsylvania, United States',
    'No lower bound — upper bound 1810',
    5,
    'complete',
    'Follow-up to SRCH-004 — searching for the underlying 1801 Rice→Philemon Boyle deed (Book T Vol. 2d pp. 156–157). Used ''Boyle'' in Keywords and ''"James Rice"'' in Name field rather than quoted full-text search. 5 results, 26 matches. Top result was Beers 1893 Washington County biographical record (BIO-001), which is already in Carolyn''s Google Play Books library. The 1801 deed did not surface in full-text results — likely not OCR''d; Catalog approach needed.',
    '2026-10-01 00:00:00+00'
);

-- SRCH-008
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-008',
    '"James Rice"',
    'Washington, Pennsylvania, United States',
    'No lower bound — upper bound 1850',
    26,
    'complete',
    'Searching for James Rice, father of Ann Rice Boyle (wife of Philemon). Goal: establish Rice family''s economic and social standing in Washington County. Initial search returned 171 results; narrowed with Name field ''"James Rice"'' and To Year 1850 to 26 results. Logging all 26 in order.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3QS7-L9S7-MWFN?view=fullText&keywords=James+Rice&searchForm=advanced&lang=en',
    '2026-10-01 00:00:00+00'
);

-- SRCH-009
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-009',
    '"James Rice" Washington County Pennsylvania USA (simple search)',
    'Washington, Pennsylvania (sidebar filter)',
    '1700 AD + 1800 AD (sidebar)',
    40,
    'complete',
    'Simple search ''"James Rice" Washington County Pennsylvania USA'' returned 2k+ results. Filtered using sidebar to 40 results using: Collection = Pennsylvania Wills and Deeds ca.1700s-2017; Year = 1700 AD + 1800 AD; Place = Washington PA (Allegheny filtered to 0); Record Type = Legal Records / Property Records / Deeds. First result produced the 1801 Rice→Philemon Boyle deed (PR-054) — the foundational document for the Carroll Township landholding. NOTE: Simple search with quoted phrase + place string in the query box, then filter via sidebar, is more effective than Advanced Search for this corpus.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSFM-SCMZ?view=fullText&keywords=James+Rice&searchForm=simple&lang=en',
    '2026-10-01 00:00:00+00'
);

-- SRCH-010
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-010',
    'Felix Boyle',
    'United States of America → Pennsylvania',
    '1700 AD (3 results shown in filter — but see notes)',
    3,
    'complete',
    'Full-text simple search ''Felix Boyle'', PA only. Screenshot shows 1700 AD filter (3 results) yielding Cumberland PA Deeds 1750–1758/1766–1776 and Franklin PA Probate 1797 in the results list. However the first URL (3Q9M-CSJ3-NCFR) actually resolves to Washington Deed Books 1884 — FamilySearch indexing quirk, possibly because the collection''s date metadata overlaps with an earlier range or OCR''d date strings in the document trigger the year filter. Processing 1700 AD results first (most likely exclusions), then will move to 1800 AD batch (123 results). Same search methodology as SRCH-001/002 (Connell Boyle) and planned SRCH-011+ for 1800 AD results.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ3-NCFR?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-SMS',
    '2026-10-02 00:00:00+00'
);

-- SRCH-011
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-011',
    'Felix Boyle',
    'United States of America → Pennsylvania (123 results); United States of America, United States of America (additional filter active)',
    '1800 AD (142)',
    142,
    'complete',
    'Same query as SRCH-010 (''Felix Boyle'', PA statewide) with 1800 AD year filter applied. 142 results. Many already logged in earlier batches (SRCH-001/002 Connell Boyle searches). First result is Washington Deed Books 1884 (= FB-001, already logged). Second result is Washington Deed Books 1871-1872, which lists Felix Boyle, Felix Boyle Jr., Felix Boyle Sr., Alice Boyle, Alice Crosby, Maria Boyle, Thomas Collins, J. R. Hazzard — almost certainly the Philemon Boyle heirs / estate partition records; high priority. Processing in order of FamilySearch result ranking; skipping records already logged in prior batches. LAMBERT RESEARCH THREAD: D.O. Lambert (Daniel O.C. Lambert) has now been documented as witness in five Boyle-adjacent records spanning 1857–1883 (PR-013, FB-002, WL-003, PR-017, PR-057). Also known to have assisted Patrick O''Neill with documents (Patrick signed by mark ''X'') — O''Neill is the family of Mary Ann O''Neill who married Captain Felix ca. late 1870s, placing Lambert at the intersection of both families. Open question: was Lambert a professional scrivener/notary operating for pay across the broader Irish Catholic community, or a trusted neighbor doing occasional favors? The Patrick O''Neill document may surface in these search results; if not, check the earlier Gemini session (approx. first 3 pages of results) where it was first encountered. FLAG: any Lambert appearance in remaining SRCH-011 results should be logged even if the underlying deed has no other Boyle connection.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CSJ3-NCFR?view=fullText&keywords=Felix+Boyle&searchForm=simple&lang=en&groupId=M9ZH-SMS',
    '2026-10-02 00:00:00+00'
);

-- SRCH-012
INSERT INTO seanchai.searches
    (search_id, search_terms, county_scope, year_filter,
     result_count, status, notes, searched_at)
VALUES (
    'SRCH-012',
    'Romania',
    'Washington PA (17 results); Fayette PA (10 results)',
    '1800 AD (25) + 1700 AD (2)',
    27,
    'complete',
    'Full-text search for ''Romania'' in Washington and Fayette Counties, 1800–1900, to trace what happened to James Rice''s Romania tract after the Boyle family period. Key motivation: Abraham Fry appeared in early results, potentially connecting to Levisey Fry (wife of John Shanton) whose family held adjacent Fallowfield Township land. Top results: Washington Deeds 1807–1810 (15 matches — includes Rice→Williams Romania deed Jan 1801 and Abraham Fry boundary references); Washington Deeds 1798–1802 (includes Rice→Crawford Romania deed Jan 1801 and ''Abraham Tryesland'' OCR of ''Abraham Frye''s land''); Crumrine 1882 county history (Carroll Township section — confirms Frye family as among the first Carroll Township settlers, Cherry Garden warrant 1769, Romania adjacent to Abraham Frye). Romania tract distributed January 19, 1801 in coordinated same-day sales to Robert Williams (92.5 ac) and William Crawford (54 ac), leaving ~117 ac for Ann Rice Boyle. Abraham Frye borders Romania on multiple sides in both deeds.

Example URL: https://www.familysearch.org/ark:/61903/3:1:3Q9M-CS4T-6BVK?view=fullText&keywords=United+States%2CPennsylvania%2CWashington%2CRomania&searchForm=advanced&lang=en',
    '2026-10-12 00:00:00+00'
);


-- --------------------------------------------------------------------------
-- Todos (23)
-- --------------------------------------------------------------------------

-- TODO-001  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-001',
    'high',
    'Run dedicated Felix Boyle search batch (SRCH-003) — find his land records, probate, and any deeds confirming relationship to Connell/John',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Felix Boyle Sr. (1813–1884) is the ''rich uncle.'' His heirs conveyed coal privileges to Connell & John, 28 Oct 1852, Book L Vol.3 pp.426–427. Planned after SRCH-002 complete.',
    NULL
);

-- TODO-002  (priority=high, status=complete)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-002',
    'high',
    'Find Felix Boyle''s heirs→Boyle brothers deed: Book L Vol.3 pp.426–427, Washington Co. PA, dated 28 Oct 1852, recorded 25 Apr 1853',
    (SELECT id FROM seanchai.todo_status WHERE name = 'complete'),
    'RESOLVED via PR-036: The ''Felix Boyle''s heirs'' coal privileges deed dated 28 Oct 1852, recorded 25 Apr 1853, Book L Vol.3 pp.426–427 = PR-036. Grantors were Alice Boyle, Mariah Boyle, Felix Boyle Sr., and Alice Crosby née Boyle (heirs of Philemon/Phelim Boyle the patriarch). Grantees: Connell and John Boyle.',
    NOW()
);

-- TODO-003  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-003',
    'high',
    'Find Robert McMillan→John and Connell Boyle deed: Book No.2 p.47, Washington Co. PA, dated 8 Oct 1838',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'First entry in Romania Farm title chain. McMillan is a new name not previously seen. PARTIAL RESOLUTION via PR-022: Connell→John Boyle deed (Apr 1855) cites same McMillan deed (8 Oct 1838) for a 7/8-acre parcel adjoining Simon Wilson — confirming this is the same McMillan grant that produced both the Romania Farm acreage and smaller adjacent parcels. Still need the source deed at Book No.2 p.47 to see the full original grant and all parties named.',
    NULL
);

-- TODO-004  (priority=high, status=complete)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-004',
    'high',
    'Find Roswell Marsh (admin. John Williams estate)→Connell and John Boyle deed: Book H Vol.3 p.65, dated 21 Feb 1850',
    (SELECT id FROM seanchai.todo_status WHERE name = 'complete'),
    'RESOLVED via PR-033: Source deed found. Roswell Marsh admin. of John Williams→Connell and John Boyle, February 1850, recorded 27 Feb 1850, pages 64–65 of Washington Deeds 1850–1851. Original agreement was 15 Dec 1837; Williams died before executing deed; Marsh completed it 13 years later. PR-028''s ''27 Feb 1840'' was OCR error for ''1850.'' Book H Vol.3 p.65 reference in PR-014/PR-018 remains slightly inconsistent with pages 64–65 here but close enough to be the same instrument.',
    NOW()
);

-- TODO-005  (priority=medium, status=complete)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-005',
    'medium',
    'Find Zephaniah Beall Wood County Ohio land patent: Vol.22 p.165, recorded Wood Co. deed book',
    (SELECT id FROM seanchai.todo_status WHERE name = 'complete'),
    'RESOLVED via PR-030: Zephaniah Beall land patent No.10,828, 21 May 1835, Patent Book No.22 p.165. 160 acres NW quarter Sec.24 Twp.7 Range 12, Wood County OH. Zephaniah and Mary Beall gifted this land to Connell and Rebecca Ann Boyle 23 Jul 1845 (PR-030). Connell and Rebecca later sold it to Willard V. Way Mar 1853 (PR-019/PR-020/PR-021).',
    NOW()
);

-- TODO-006  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-006',
    'medium',
    'Verify PR-014 acreage discrepancy: PR-014 reads ''243 acres 9 perches''; PR-016 reads ''143 acres 9 perches'' — check deed image',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    '143 is likely correct; ''243'' in PR-014 is probably OCR noise. Verify against original image before using acreage in memoir.',
    NULL
);

-- TODO-007  (priority=medium, status=complete)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-007',
    'medium',
    'Resolve Fitzsimmons→Wallace deed date discrepancy: PR-008 cites 28 Jun 1856; GV-001 and PR-005 give 1858',
    (SELECT id FROM seanchai.todo_status WHERE name = 'complete'),
    'RESOLVED via PR-024: Fitzsimmons→Wallace deed confirmed as 28 Jun 1858. PR-008''s ''1856'' was wrong. PR-024 also confirms the Boyle→Fitzsimmons coal deed page is 219 (not 519 as OCR''d in PR-009 and PR-014).',
    NOW()
);

-- TODO-008  (priority=medium, status=complete)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-008',
    'medium',
    'Find Connell Boyle death record — confirm date; now known to be before November 1860',
    (SELECT id FROM seanchai.todo_status WHERE name = 'complete'),
    'RESOLVED via PR-044: Connell Boyle estate probated 1861, Washington County. Felix Boyle Jr. named administrator. Death between November 1860 (PR-041 cites ''Connell Boyle''s Estate'' as adjacent landowner) and the 1861 probate filing — almost certainly early 1861. Find actual death record for precise date.',
    NOW()
);

-- TODO-009  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-009',
    'medium',
    'Research new family members from PR-017: Zephaniah M. Boyle, John Boyle Jr., Annie B. McGurgan née Boyle',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'All three are Connell''s children, first documented in the 1881 Myers quitclaim deed. Zephaniah named for maternal grandfather Zephaniah Beall.',
    NULL
);

-- TODO-010  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-010',
    'high',
    'Research Ira R. Butler — Washington County J.P. and adjacent landowner who witnessed nearly every Boyle deed 1853–1857',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Check Washington County county histories. Butler owned land adjoining the Romania Farm (cited in PR-015 metes and bounds as boundary marker). His repeated presence as J.P. and witness on nearly every Boyle deed 1853–1857 suggests he was effectively the Boyle family''s legal infrastructure — their external working memory for transactions. May also appear in Allegheny County records as families moved there. No connection to Butler PA (Butler County) — different place. Check whether Butler had any financial relationship with the Boyles beyond J.P. services.',
    NULL
);

-- TODO-011  (priority=low, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-011',
    'low',
    'Find Boyle→Moorhead deed: Book N Vol.3 p.339, 13 May 1854 — the trust deed referenced in PR-004 and PR-015',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'SOURCE DEED FOUND via PR-026/PR-027: Boyle→Moorhead deed 13 May 1854 now logged. Receipt in PR-027 names grantee as ''James K. Moorhead'' \u2014 earlier records cited ''J. Kennedy Moorhead.'' Discrepancy (K. vs. Kennedy) needs verification \u2014 same person or different Moorhead? Moorhead→Boyle trust deed back (7 Jun 1855, Book Vol.3 p.139) still not retrieved.',
    NULL
);

-- TODO-012  (priority=low, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-012',
    'low',
    'Identify ''P. Hargs'' — location reference in PR-018 agreement (''from the lock aforesaid to P. Hargs about ninety rods'')',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Probably a person''s name used as a landmark (Harris? Hargis?). Reuben Harris appears as adjacent landowner in PR-017 — may be same family.',
    NULL
);

-- TODO-023  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-023',
    'medium',
    'Search FamilySearch for Samuel Black, Washington County PA. He appears in a Carroll Township deed of trust (1826, Book P Vol.2 pp.111–112) holding 190 acres on the Monongahela River bank. Connect to ''comrade named Black'' who saved Phelim on the flatboat (Beers 1893) and Ross/Marcus Black who witness the 1845 Boyle deed (PR-052). Goal: establish the Black family as a continuous Carroll Township presence across 3 generations. Also search ''Black'' Carroll Township more broadly.',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    NULL,
    NULL
);

-- TODO-013  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-013',
    'high',
    'Allegheny County records search — Rebecca A. Boyle (post-1861), Captain Felix Boyle, and other Connell children (Zephaniah M., John Jr., Annie McGurgan)',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Rebecca moved to Allegheny County after Connell''s death (1861). Unknown whether she lived with Captain Felix or independently. Search census records 1870, 1880, 1890, 1900; death record ca. 1899; probate if any. Also search Captain Felix''s records: Civil War pension (rich biographical detail), whiskey distillery failure ca. 1884, and any deeds or property records.',
    NULL
);

-- TODO-014  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-014',
    'high',
    'Find Captain Felix Boyle''s burial record in Homestead PA — identify who claimed his body and where he is interred',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Captain Felix Boyle died 17 Aug 1916 at National Military Home, Dayton, Montgomery County, Ohio. Cause: chronic interstitial nephritis. Listed as married (Mary Ann). Informant: George Paul (staff/fellow resident — not family). Father/mother/birthplace all Unknown — his entire history lost to those around him. Buried Homestead PA, 21 Aug 1916. Someone in Homestead claimed his body — likely a child or grandchild. Find burial location and who arranged it. Homestead is a steel town in Allegheny County — significant family connection there.',
    NULL
);

-- TODO-015  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-015',
    'medium',
    'Find Captain Felix Boyle''s Civil War pension records — will document health, finances, and family situation in later life',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Captain Felix (PR-017: Felix Boyle Jr., married Mary Ann) was partner in a whiskey distillery that failed ca. 1884, same year Felix Sr. died. Civil War pension records often contain detailed biographical and medical information and may document alcoholism and financial decline. Search Allegheny County and Pennsylvania pension records.',
    NULL
);

-- TODO-016  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-016',
    'medium',
    'Research Samuel Black — Felix Sr.''s friend and protector; hatchet incident; search Washington and Allegheny County records',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Possible name: Samuel Black. Connected to Felix Sr. as friend and protector — specific incident or relationship involves a hatchet (source and details TBD from Carolyn). May appear in Washington County or Allegheny County records alongside Felix Sr.',
    NULL
);

-- TODO-017  (priority=low, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-017',
    'low',
    'Low priority: search Mary Beall (Rebecca''s mother) and Joshua O. Beall (probable brother of Rebecca) in Washington County records',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Mary Beall confirmed as Zephaniah Beall''s wife in PR-030 (Jul 1845 gift deed). Joshua O. Beall witnessed the 1853 Ohio land sale (PR-020) — probably Rebecca''s brother, making him Captain Felix''s uncle. Low priority unless more close family interaction surfaces in other searches.',
    NULL
);

-- TODO-018  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-018',
    'medium',
    'Find St. Mary''s Cemetery Munhall plot purchase record for Captain Felix Boyle and/or Mary Ann Boyle',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Theory: Mary Ann pre-purchased the family plots at St. Mary''s Cemetery, Munhall (Allegheny County PA), which is why Felix''s body was returned from the National Military Home in Dayton OH in 1916 despite him dying estranged and alone. Plot purchase date would reveal when the arrangement was made — whether during the marriage (hopeful period), after separation, or by a child. St. Mary''s may have cemetery records accessible via the parish, the Allegheny County historical society, or FindAGrave. Virginia McCurdy photographed Felix and Mary Ann''s joint burial marker there in April 2019 — she may know whether plot records are available.',
    NULL
);

-- TODO-019  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-019',
    'medium',
    'Find Pittsburgh Business Directory 1867 — contributed by John D. Boyle Sr. to Washington Borough Town Hall cornerstone, September 1869',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'John D. Boyle Sr. contributed a Pittsburgh Business Directory of 1867 to the cornerstone time capsule of Washington Borough Town Hall, September 18, 1869 (per Creigh''s History of Washington County). The directory would document Pittsburgh business networks in the year Felix Sr. died and Captain Felix was rebuilding after his court-martial. May also show John D.''s own Pittsburgh business connections. Search Carnegie Library of Pittsburgh digital collections, Internet Archive, and Ancestry for Pittsburgh Business Directory 1867.',
    NULL
);

-- TODO-020  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-020',
    'medium',
    'Create Google Drive documents to hold overflow from full memory files — starting with people-and-family-history.md',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'people-and-family-history.md is essentially full (18 bytes free as of Oct 2 2026). New findings need a home. Options: (1) Create Google Drive docs mirroring the key memory files, with full content plus overflow; (2) Spin off major sub-topics into their own memory files (e.g., a dedicated file for Captain Felix, Felix Sr., Connell''s children); (3) Do a condensation pass on people-and-family-history.md to remove verbose passages that are better held in Drive docs. Recommended: create Drive docs first as the authoritative long-form record, then condense the memory files to pointers + key facts only.',
    NULL
);

-- TODO-021  (priority=high, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-021',
    'high',
    'Find primary source for Felix Boyle Sr. birthplace independent of BIO-001 — resolves whether EX-010 (Pittsburgh naturalization 1833/1838) is Felix Sr. or a different person',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'BIO-001 gives Felix Sr. birthplace as Carroll Township, June 13, 1813 — but source is Elizabeth V. Henderson Boyle (second wife, married 1873), sixty years after the fact. EX-010 (Pittsburgh naturalization, Oct 1833 declaration, Sept 1838 petition) is reclassified UNCERTAIN because ''native of Ireland'' may be clerk shorthand for ''Irish subject'' rather than ''Irish-born,'' and the timing fits Felix Sr.''s known Shreve/federal employment biography perfectly. If Carroll Township birth confirmed by earlier primary source, EX-010 is a different person. Search: 1820/1830 census (Phelim''s household should list children by age range); Washington County birth records if any exist; church baptismal records Carroll Township area.',
    NULL
);

-- TODO-022  (priority=medium, status=open)
INSERT INTO seanchai.todos
    (todo_id, priority, description, todo_status_id, notes, completed_at)
VALUES (
    'TODO-022',
    'medium',
    'J.K. Moorhead acquisition pattern study — did he routinely structure investments so capital was protected by real estate, acquiring productive property when operating partners defaulted?',
    (SELECT id FROM seanchai.todo_status WHERE name = 'open'),
    'Working hypothesis: Moorhead may have entered the C.&J. Boyle partnership knowing that default was a plausible outcome and that the downside (acquiring the coal/land package) was acceptable. This is not ''deliberate predation'' but asymmetric risk — if the Boyles succeed, Moorhead profits; if they fail, he gets the property. The Boyles paid $4,000 of their moiety before defaulting, effectively partially funding their own dispossession. Test by building a classification table of Moorhead''s 1850–1870 transactions: (1) role (capital/partner vs. creditor), (2) other party (small operator vs. peer investor), (3) property secured?, (4) business subsequently failed?, (5) property ultimately to Moorhead? SEARCH PLAN — three sources: (A) Allegheny County official land records (online), search ''Moorhead J K'' / ''Moorhead John K'' / ''Moorhead John Kirk'' for 1850–1870, look specifically for mortgage→assignment→default→sheriff''s sale→deed to Moorhead sequences; (B) Chronicling America newspaper archives, search ''J. K. Moorhead'' with terms: mortgage, sheriff, sale, assigned, trust, judgment, execution, partnership, insolvent, creditor — then follow named businesses for subsequent failure notices; (C) use $20,042.40 as a search anchor to find the Boyle transaction in Pittsburgh papers independently of the Boyle name. CONTEXT: Moorhead was associated with Jay Cooke & Co. from its founding in 1861, bringing business connections; president of Monongahela Navigation Company by 1881; later US Congressman. Not a passive financier — deeply embedded in Pittsburgh transportation/industrial capital networks. Carnegie/Frick analogy useful as historical context, not as accusation. The mechanism — disregarding human beings as line items in a capital structure — is the Gilded Age norm, not necessarily personal malice.',
    NULL
);


-- --------------------------------------------------------------------------
-- todo_records junctions
-- (SELECT-based: silently skips if record_id not present)
-- --------------------------------------------------------------------------

INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-001' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-001' AND r.record_id = 'PR-016';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-001' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-002' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-002' AND r.record_id = 'PR-016';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-002' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-003' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-003' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-004' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-004' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-005' AND r.record_id = 'PR-019';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-006' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-006' AND r.record_id = 'PR-016';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-007' AND r.record_id = 'PR-005';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-007' AND r.record_id = 'PR-008';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-007' AND r.record_id = 'GV-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-008' AND r.record_id = 'PR-015';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-008' AND r.record_id = 'PR-017';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-008' AND r.record_id = 'PR-041';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-009' AND r.record_id = 'PR-017';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-002';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-012';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-013';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-014';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-015';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-010' AND r.record_id = 'PR-019';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-011' AND r.record_id = 'PR-004';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-011' AND r.record_id = 'PR-015';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-012' AND r.record_id = 'PR-018';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-023' AND r.record_id = 'BIO-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-023' AND r.record_id = 'PR-052';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-023' AND r.record_id = 'PR-053';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-013' AND r.record_id = 'PR-017';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-013' AND r.record_id = 'WL-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-013' AND r.record_id = 'WL-002';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-014' AND r.record_id = 'PR-017';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-014' AND r.record_id = 'PR-023';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-015' AND r.record_id = 'PR-017';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-015' AND r.record_id = 'PR-023';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-017' AND r.record_id = 'PR-030';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-017' AND r.record_id = 'PR-019';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-017' AND r.record_id = 'PR-020';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-018' AND r.record_id = 'MR-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-019' AND r.record_id = 'FB-004';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-021' AND r.record_id = 'EX-010';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-021' AND r.record_id = 'BIO-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-021' AND r.record_id = 'FB-003';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-021' AND r.record_id = 'PT-001';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-022' AND r.record_id = 'PR-026';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-022' AND r.record_id = 'PR-027';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-022' AND r.record_id = 'PR-051';
INSERT INTO seanchai.todo_records (todo_id, record_id)
SELECT t.id, r.id FROM seanchai.todos t, seanchai.records r
WHERE t.todo_id = 'TODO-022' AND r.record_id = 'PR-039';

-- --------------------------------------------------------------------------
-- Skipped non-record references (context captured in todo descriptions):
  -- TODO-023: skipped non-record refs: ['this deed']
  -- TODO-016: skipped non-record refs: ['people/captain-felix-boyle.md']
  -- TODO-018: skipped non-record refs: ['TODO-014', 'people/captain-felix-boyle.md']
  -- TODO-019: skipped non-record refs: ['BIO-003', 'people/captain-felix-boyle.md']
-- --------------------------------------------------------------------------

COMMIT;

-- Expected: 102 records, 12 searches,
--           23 todos, 53 todo_record junctions