# ============================================================================
# FILE: converter_truncate_kind.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from deoplete.base.filter import Base
from deoplete.util import truncate_skipping


class Filter(Base):
    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'converter_truncate_kind'
        self.description = 'truncate kind converter'

    def filter(self, context):
        max_width = context['max_kind_width']
        if not context['candidates'] or 'kind' not in context[
                'candidates'][0] or max_width <= 0:
            return context['candidates']

        footer_width = max_width / 3
        for candidate in context['candidates']:
            candidate['kind'] = truncate_skipping(
                candidate.get('kind', ''),
                max_width, '..', footer_width)
        return context['candidates']
