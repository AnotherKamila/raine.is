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

{% for variant in checklist_data.variants %}
<details>
  <summary>{{ variant[1] }}</summary>

  <div class="checklist-container">
    {% for section in checklist_data.checklist %}
      {% capture section_id %}checklist-{{ variant[0] }}-{{ section.title | slugify }}{% endcapture %}
      <section class="checklist" id="{{ section_id }}">
        <h3>{{ forloop.index }}. {{ section.title }}</h3>
        <ul>
          {% for item in section.items %}
            {% assign item_stripped = item | strip %}
            {% assign variant_prefix = '.' | append: variant[0] %}
            {% assign item_start = item_stripped | slice: 0, variant_prefix.size %}
            {% assign first_char = item_stripped | slice: 0, 1 %}
            {% if item_start == variant_prefix or first_char != '.' %}
              {% assign item_display = item_stripped %}
              {% if item_start == variant_prefix %}
                {% assign item_display = item_stripped | remove_first: variant_prefix | strip %}
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
