---
title: Pluslife Checklist
add_to_head: <link rel="stylesheet" href="/assets/css/checklist.css" />
---

The [Pluslife MiniDock](https://www.pluslife.com/productinfo/1207325.html)
is awesome -- its sensitivity to COVID-19 is comparable to a good PCR
test and is absolutely batshit for something that fits into my pocket
when you think about it.

This is a checklist that summarizes the important steps when running a test.

<!--more-->

This is just for quick reference and it **does not replace reading the
manual** or [the virus.sucks notes](https://virus.sucks/pluslife_en/).

<!-- Beware: the template code is disgusting. -->

{% assign checklist_data = site.data["pluslife-checklist"] %}

{% for testtype in checklist_data.testtypes %}
  {% # hack for the id: name structure in yaml }
  {% for pair in testtype %}
    {% assign test_id = pair[0] %}
    {% assign test_name = pair[1] %}
  {% endfor %}
  <details>
    <summary>{{ test_name }}</summary>

    <div class="checklist-container">
      {% for section in checklist_data.checklist %}
        {% capture section_id %}checklist-{{ test_id }}-{{ section.title | slugify }}{% endcapture %}
        <section class="checklist" id="{{ section_id }}">
          <h3>
            {{ forloop.index }}. {{ section.title }}
            <a class="checklist-anchor" href="#{{ section_id }}" aria-label="Link to {{ section.title }}">#</a>
          </h3>
          <ul>
            {% for item in section.items %}
              {% assign item_stripped = item | strip %}
              {% assign test_prefix = '.' | append: test_id %}
              {% assign item_start = item_stripped | slice: 0, test_prefix.size %}
              {% assign first_char = item_stripped | slice: 0, 1 %}
              {% if item_start == test_prefix or first_char != '.' %}
                {% assign item_display = item_stripped %}
                {% if item_start == test_prefix %}
                  {% assign item_display = item_stripped | remove_first: test_prefix | strip %}
                {% endif %}
                {% assign item_main = item_display %}
                {% assign item_detail = '' %}
                {% if item_display contains '|' %}
                  {% assign item_main = item_display | split: '|' | first | strip %}
                  {% assign item_detail = item_display | split: '|' | last | strip %}
                {% endif %}
                {% capture checkbox_id %}checklist-{{ forloop.parentloop.index }}-{{ forloop.index }}{% endcapture %}
                <li>
                  <input type="checkbox" id="{{ checkbox_id }}">
                  <label for="{{ checkbox_id }}">
                    {{ item_main | markdownify | remove: '<p>' | remove: '</p>' | strip }}
                    {% if item_detail != '' %}
                      <br>
                      <span class="checklist-item-detail">{{ item_detail | markdownify | remove: '<p>' | remove: '</p>' | strip }}</span>
                    {% endif %}
                  </label>
                </li>
              {% endif %}
            {% endfor %}
          </ul>
        </section>
      {% endfor %}
    </div>

  </details>
{% endfor %}

[Patches welcome!](https://github.com/AnotherKamila/raine.is/blob/main/_data/pluslife-checklist.yml)

<script>
  (() => {
    const sections_sel = document.querySelectorAll('.checklist');

    const updateChecklistSectionState = (section) => {
      const checkboxes = section.querySelectorAll('input[type="checkbox"]');
      const allChecked = Array.from(checkboxes).every((checkbox) => checkbox.checked);
      console.log('allChecked:', allChecked)

      section.classList.toggle('complete', allChecked);

      // If all items in this section are checked, go to the next incomplete section via location.hash (by using .complete class)
      if (allChecked) {
        const sections = Array.from(sections_sel);
        const currentIndex = sections.indexOf(section);
        for (let i = currentIndex + 1; i < sections.length; i++) {
          if (!sections[i].classList.contains('complete')) {
            // Go to the next incomplete section
            location.hash = '';
            sections[i].scrollIntoView({ behavior: 'smooth', block: 'start' });
            // Set hash if section has heading with id
            const heading = sections[i].querySelector('h3[id]');
            if (heading && heading.id) {
              location.hash = '#' + heading.id;
            }
            break;
          }
        }
      }
    };

    sections_sel.forEach((section) => {
      const checkboxes = section.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', () => {
          updateChecklistSectionState(section);
        });
      });

      updateChecklistSectionState(section);
    });
  })();
</script>