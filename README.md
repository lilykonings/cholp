Cholp
=====
This website was private property and should not be used or altered without appropriate permissions from the organization.

Todo
-------------
**Homepage**
* [X] Section headings (ie Top Prints, Top Creators, etc) should not be situated above their respective boxes, should be embedded between the lines (See Mock 1- Homepage)
* [ ] Creator Thumbnails (in the Top Creators box) are wrong. See Mock 1 and compare with what is on the site now. For each thumbnail, the image should be smaller, the creator name (linked) should be pulled up higher, the number of prints they have uploaded should be listed below the name, and a short 3 line excerpt from their bio should be at the bottom of the thumbnail
  * [X] Bio should be cut off after 3 lines (…)
* Print Thumbnails (See Mock 5 for a good example)
  * [ ] Images should be bigger, date that the print was uploaded should appear below the title, and the number of views should appear next to the upload date
  * [X] There should be no descriptions for these thumbnails
* Updates Section
  * See Mock 1 (Homepage)
  * [ ] Section where we can link informational pages on the site (if we want to change our terms of use, or feature a story about the site, or feature additions to functionality)
  * Example: line “Additions Have Been Made to Cholp” would appear in the updates section,, user would then click on the line, would link to page with information (text) on site additions
  * [ ] We need the ability to manage the updates section, possibly through our existing featured section admin portal (cholp/featured while logged in as administrator)
    * [ ] Updates section form (within admin panel) should include 5 slots.  Each slot should have boxes to enter: a title (to be listed in the updates section and the title to the linked page) text (the paragraphs that will appear on the linked page) and date (which will appear at the bottom of each linked page)
    * See Mock 7 (what pages linked in the updates section should generally look like) and Mock 8 (what the Admin Panel should look like) THESE WILL HELP
* Featured section
  * See Mock 1 (Homepage)
  * See www.ign.com for an example
  * [ ] As we discussed in the meeting: Featured section should be scrollable. Should include graphics with linked text laid over.  Side bar snapped to the right side of the box should include title tiles which can be used to navigate between the different featured slots. 
  * [ ] We need the ability to manage the featured section, again, possibly through modifying our existing featured section admin portal (cholp/featured while logged in as administrator)
    * [ ] A small form with 5 possible slots. each slot consists of spaces to enter: a title for the tile, main title (overlaid over graphic), and link (which clicking on the main title will link to) as well as place to upload a graphic
    * See Mock 8
* Top Creators Section
  * [ ] Need to be able to manage this already existing section (again, possibly through the existing admin portal)
  * [ ] Form should include slots for us to enter up to 5 creators. I guess we will have to type exact profile names as they appear on the site for this mechanism to work.  After saving the form, the creator’s thumbnail should appear in the top creators section.  
  * See Mock 8 for form example
* [ ] Front Type (See Instructions_Copy)

**Individual Print Page**
* [ ] Specs section bars are wrong (outline is not thick enough) (See Tabs.png document)
* [ ] Creator thumbnail should not be boxed in, and “uploaded by” title should not exist
* [ ] Recommended Prints section should not be boxed in
* [ ] Recommended Prints section should be labeled with the word “Recommended”, not “Recommended Prints”
* [ ] “Recommended” font size should be bigger (See Mock 4)
* [ ] Description, Specs, and Comments titles need to be bigger (See Mock 4)
* [ ] Selected images should not have black margins
* [ ] Profile Thumbnails (See 1B on this doc)
* [ ] Individual Print Thumbnails (See 1C on this doc)
* [ ] Font Type (See Instructions_Copy)

**Creator Page**
* See Mock 5
* [ ] “Date joined” (currently listed as “since 10/10/10”), number of uploaded prints, and email should appear to the right of the Bio (See Mock 5)
* [ ] Social media icons/ links should appear below profile image
* [ ] Scrollable featured section should include information (ie image, upload name, number of views, upload date, and description) from selected prints (form to feature prints already exists in creator portal and information is already all stored on individual print pages)- See Mock 5 for a good illustration of what we are going for with this space (simply organizing information from individual print pages)
* [ ] “Top prints from…”should be labeled “Popular From…” and should not be boxed in
* [ ] “View All” button should line up evenly with “Popular from…”
* [ ] Creator name should not be yellow, and should be bigger (See Mock 5)
* [ ] There are some small corresponding changes that must be made to the “profile page form” (which is linked in the creator portal and is the medium through which creators manage their profile pages)
  * [ ] Needs space to type in email (optional)
  * [ ] Needs space to type in FB URL, Twitter URL, and GMAIL URL (to be linked to icons underneath the profile image)
  * [ ] Featured prints drop down menu should NOT change (this already exists)
* [ ] Font Type (See Instructions_Copy)

**General**
* [ ] Fonts, colors, and spacing on all pages (See Mocks)
  * These were not implemented accurately
  * See attached document, Instructions-Copy
  * Fonts and colors for all pages
* [ ] Thumbnail issues for all pages (INCLUDING SEARCH RESULTS), se 1B and 1C in this doc
* [ ] General Site Header (Spacing, Login/ Logout button should be off white like the background, search bar should look like mocks and have rounded edges, logo should be slightly bigger, “Sign Up” and “Login/ Logout” should be capitalized)
* [ ] Footer text should bold
* [ ] Grid System You Discussed Implementing
* [ ] MAKING THE PAGES LOOK LIKE MOCKS THROUGHOUT THE SITE

Quick Start
-------------
- Make sure postgresql is running locally
- Change database configuration in config/database.yml. Example:

  ```
  development:
    adapter: postgresql
    encoding: utf8
    pool: 5
    database: cholp
    username: root
    password: root
    host: localhost
    port: 5432
  ```
- If db/schema.rb does not exist, run `rake db:schema:dump`
- If db/migrations folder is empty, run `rails generate migration create_database_structure` and move the contents of schema.rb into the up method of the created file
- Make sure `gem 'yaml_db'` is in your Gemfile and run `bundle install`, then `rake db:migrate`
- If dump file (data.yml) exists:
  - Run `rake db:reset`
  - Run `rake db:data:load`
- Run `rails server`
