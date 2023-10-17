# W-14179000 - Query called in the Apex controller through LWC component behaving differently in Winter'24 Orgs

## Repro
1. Clone this repository
2. Create a scratch org
3. Enable digital experiences (Setup -> Digitial Experiences -> Setup)
4. Deploy to your scratch org
5. Open the org
6. Create one CustomObject1 object (switch to Sales App, the tab should be there)
7. Go to the deployed site's builder (Setup -> Digital Experiences -> All Sites, click on Builder next to the site)
8. Click on Settings, and then click on the Guest User Profile
9. Add AuraController to the list of allowed Apex Classes
10. Click on the Publish button in the top right (you have to publish to allow Guest Access)
11. In an incognito window, load the site (copy the URL from the site list, clicking on it will not work, and copying the link address will not either. You have to physcially copy the URL with your mouse)
12. Observe that 0 CustomObjec1 objects are returned to the aura component (see it on the screen)
13. Now open an Account (create one if needed), and see the same Aura Component on the record page will show 1 object returned


The object should be returned in the site too.  It is not returned because the wrong SecurityContext is pushed due to the name of the site (10kconnect), which matches a setup entity keyprefix, and SETUP_MODE is pushed instead.

I have a possible fix here: https://gitcore.soma.salesforce.com/core-2206/core-public/compare/p4/246-patch...t/cce/setup-urls