package dev.partenon.museumcontext.core.application.handlers;

import dev.partenon.global.domain.abstractcomponents.query.QueryHandler;
import dev.partenon.global.domain.model.Page;
import dev.partenon.global.domain.model.PagedResponse;
import dev.partenon.museumcontext.core.application.MuseumRepository;
import dev.partenon.museumcontext.core.doamin.models.MuseumProjection;
import dev.partenon.museumcontext.core.doamin.query.GetMuseumByNameQuery;
import dev.partenon.museumcontext.core.doamin.Museum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class GetMuseumByNameQueryHandler implements QueryHandler<PagedResponse<MuseumProjection>, GetMuseumByNameQuery> {
    @Autowired
    private MuseumRepository repository;

    @Override
    public PagedResponse<MuseumProjection> handle(GetMuseumByNameQuery query)
            throws Exception {
        var pageable = createPageable(query.getPage());
        var pages = repository.searchByName(query.getCharactersNames(), pageable);

        var content = new LinkedList<MuseumProjection>();
        if(pages.getNumberOfElements() != 0){
            pages.getContent().forEach(x ->{
                var projection =new MuseumProjection(x.getMuseumId(), x.getMuseumName());
                projection.setBanner(x.getMuseumBanner() != null
                        ? x.getMuseumBanner().getBanner() : null);
                projection.setDescription(x.getMuseumDescription() != null
                        ? x.getMuseumDescription().getDescription() : null);
                content.addLast(projection);
            });
        }

        return new PagedResponse(content, pages.getNumber(), pages.getSize(),
                pages.getTotalElements(), pages.getTotalPages(), pages.isLast());
    }

    /**
     * Crea el objeto {@link Pageable} necesario para la paginación
     *
     * @param page Contiene los parámetros  necesarios para crear el objeto
     * @return
     */
    private Pageable createPageable(Page page) {
        if (page.getOrder().equals("asc")) {
            return PageRequest.of(page.getIndex(), page.getSize(), Sort.Direction.ASC, page.getSort());
        }
        return PageRequest.of(page.getIndex(), page.getSize(), Sort.Direction.DESC, page.getSort());
    }

    /**
     * Comprueba que lo datos para crear el objeto {@code Pageable} sean válidos
     *
     * @param index Número de página
     * @param size  Tamaño de página
     * @param order Orden puede ser ascendente o descendente
     */
    private void validatePageNumberAndSize(int index, int size, String order) throws Exception {
        if (index < 0) {
            throw new Exception("Número de página no puede ser menor a 0");
        }

        if (size < 0) {
            throw new Exception("Tamaño de página no puede ser menor a 0");
        }

        if (size > 25) {
            throw new Exception("Tamaño de página no puede ser mayor a " + 25);
        }
        if (!order.equals("asc") && !order.equals("desc")) {
            throw new Exception("Orden no válidos");
        }
    }
}
